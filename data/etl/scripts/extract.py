import requests
from pathlib import Path
import time
from .config import Config
from datetime import timedelta
import json

import asyncio
import httpx
from aiolimiter import AsyncLimiter
import logging
from contextlib import AsyncExitStack

config = Config()

BASE_URL = config.get_yaml()["ballchasing"]["base_url"]
TIMEOUT = config.get_yaml()["ballchasing"]["timeout"]
BALLCHASING_API_KEY = config.get_ballchasing_api_key()

def fetch_replay_ids(replay_date, playlist, rank, calls_per_second=2, calls_per_hour=500, log=None):
    formatted_date_start = replay_date.strftime("%Y-%m-%dT00:00:00Z")
    formatted_date_end = (replay_date + timedelta(days=1)).strftime("%Y-%m-%dT00:00:00Z")

    url = f"{BASE_URL}/replays"
    headers = {"Authorization": BALLCHASING_API_KEY}
    params = {
        "playlist": playlist,
        "min-rank": rank,
        "max-rank": rank,
        "replay-date-after": formatted_date_start,
        "replay-date-before": formatted_date_end,
        "count": 200,
        "sort-by": "replay-date",
        "sort-dir": "desc"
    }

    daily_replay_ids = []
    hourly_request_count = 0
    last_request_time = time.time()
    
    while url:
        # Check hourly rate limit
        if calls_per_hour and hourly_request_count >= calls_per_hour:
            wait_time = 3600 - (time.time() - last_request_time)
            if wait_time > 0:
                log.warning(f"Hourly rate limit reached after {len(daily_replay_ids)} replays. Waiting {wait_time:.2f} seconds...")
                time.sleep(wait_time)
            hourly_request_count = 0
            last_request_time = time.time()

        # Make the request to the current URL
        try:
            response = requests.get(url, headers=headers, params=params, timeout=TIMEOUT)
            response.raise_for_status()
        except requests.exceptions.HTTPError as e:
            if response.status_code == 429:
                # Dont break, retry same request
                retry_after = int(response.headers.get('Retry-After', 3600))
                log.warning(f"Rate limit exceeded via HTTP 429 status code. Waiting {retry_after} seconds...")
                time.sleep(retry_after)
            else:
                log.error(f"HTTP error fetching replay IDs for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}. Status Code {response.status_code}: {response.text}\n")
                raise e
        except Exception as e:
            log.error(f"Non-HTTP error fetching replay IDs for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}. Status Code {response.status_code}: {response.text}\n")
            raise e
        
        hourly_request_count += 1
        last_request_time = time.time()

        replays = response.json().get('list', [])  # List of replays on the current page
        log.debug(f"Fetched {len(replays)} replays")
        for replay in replays:
            id = replay.get('id')
            daily_replay_ids.append(id)
        
        # Check if there is a "next" key for pagination
        url = response.json().get('next', None)  # If there is a "next" key, update the URL to the next page

        # Sleep to stay within the call/sec rate limit
        time.sleep(1 / calls_per_second)

    return daily_replay_ids

def fetch_replays_by_id(replay_ids, calls_per_second=2, calls_per_hour=500, log=None):
    daily_replays = []
    headers = {"Authorization": BALLCHASING_API_KEY}
    hourly_request_count = 0
    last_request_time = time.time()
    
    for replay_id in replay_ids:
        # Check hourly rate limit
        if calls_per_hour and hourly_request_count >= calls_per_hour:
            wait_time = 3600 - (time.time() - last_request_time)
            if wait_time > 0:
                log.warning(f"Hourly rate limit reached after {len(daily_replays)} replays. Waiting {wait_time:.2f} seconds...")
                time.sleep(wait_time)
            hourly_request_count = 0
            last_request_time = time.time()

        # Max calls/sec
        time_between_calls = 1 / calls_per_second
        elapsed = time.time() - last_request_time
        if elapsed < time_between_calls:
            time.sleep(time_between_calls - elapsed)

        # Make the request to the current URL
        url = f"{BASE_URL}/replays/{replay_id}"
        response = requests.get(url, headers=headers, timeout=TIMEOUT)
        hourly_request_count += 1
        last_request_time = time.time()
        
        if response.status_code == 200:
            replay_data = response.json()
            daily_replays.append(replay_data)

            # Sleep to stay within the rate limit
            time.sleep(time_between_calls)

        elif response.status_code == 429:
            retry_after = int(response.headers.get('Retry-After', 3600))
            log.warning(f"Rate limit exceeded. Waiting {retry_after} seconds...")
            time.sleep(retry_after)
            # Dont break, retry same request

        else:
            raise Exception(f"Error fetching replay {replay_id}. Status Code: {response.status_code}\n")

    return daily_replays
class ReplayFetcher:
    def __init__(self, base_url: str, headers: dict, timeout: int, replay_rate_limit: tuple, id_rate_limit: tuple, log: logging.Logger):
        self.base_url = base_url
        self.headers = headers
        self.timeout = timeout
        
        self.replay_secondly_limiter = AsyncLimiter(replay_rate_limit[0], 1)
        self.replay_hourly_limiter = AsyncLimiter(replay_rate_limit[1], 3600) if replay_rate_limit[1] else None
        self.id_secondly_limiter = AsyncLimiter(id_rate_limit[0], 1)
        self.id_hourly_limiter = AsyncLimiter(id_rate_limit[1], 3600) if id_rate_limit[1] else None

        self.client = httpx.AsyncClient(http2=True, headers=headers, timeout=timeout)
        
        self.log = log

    def set_params(self, playlist, rank, replay_date, count, sort_by, sort_dir):
        formatted_date_start = replay_date.strftime("%Y-%m-%dT00:00:00Z")
        formatted_date_end = replay_date.strftime("%Y-%m-%dT23:59:59Z")
        
        self.params = {
            "playlist": playlist,
            "min-rank": rank,
            "max-rank": rank,
            "replay-date-after": formatted_date_start,
            "replay-date-before": formatted_date_end,
            "count": count,
            "sort-by": sort_by,
            "sort-dir": sort_dir
        }

    async def _fetch_replays(self):
        limiters = [self.replay_secondly_limiter]
        if self.replay_hourly_limiter:
            limiters.append(self.replay_hourly_limiter)

        url = f"{self.base_url}/replays"
        replay_data = []

        while url:
            async with AsyncExitStack() as stack:
                # Enter all limiters contexts
                for limiter in limiters:
                    await stack.enter_async_context(limiter)
                
                try:
                    replays_response = await self.client.get(url, headers=self.headers, params=self.params, timeout=self.timeout)
                    replays_response.raise_for_status()
                except httpx.HTTPStatusError as e:
                    self.log.error(f"HTTP status error fetching replays. Status Code {e.response.status_code}: {e.response.text}\n")
                except httpx.TimeoutException:
                    self.log.error(f"Timeout error fetching replays\n")
                except httpx.RequestError as e:
                    self.log.error(f"Non-HTTP error fetching replays. Status Code {e.response.status_code}: {e.response.text}\n")
                
                for replay in replays_response.json().get('list', []):
                    id_response = await self._fetch_id_stats(replay.get('id'))
                    replay_data.append(id_response)

                url = replays_response.json().get('next', None)

        self.log.info(f"Fetched {len(replay_data)} replays for {self.params['playlist']} in {self.params['min-rank']} on {self.params['replay-date-after'][:10]}")
        return replay_data

    async def _fetch_id_stats(self, replay_id):
        limiters = [self.id_secondly_limiter]
        if self.id_hourly_limiter:
            limiters.append(self.id_hourly_limiter)

        async with AsyncExitStack() as stack:
            # Enter all limiters contexts
            for limiter in limiters:
                await stack.enter_async_context(limiter)
            
            try:
                id_response = await self.client.get(f"{self.base_url}/replays/{replay_id}", headers=self.headers, timeout=self.timeout)
                id_response.raise_for_status()
            except httpx.HTTPStatusError as e:
                self.log.error(f"HTTP status error fetching replay ID {replay_id}. Status Code {e.response.status_code}: {e.response.text}\n")
            except httpx.TimeoutException:
                self.log.error(f"Timeout error fetching replay ID {replay_id}\n")
            except httpx.RequestError as e:
                self.log.error(f"Non-HTTP error fetching replay ID {replay_id}. Status Code {e.response.status_code}: {e.response.text}\n")

            self.log.debug(f"Fetched replay ID {replay_id}")
            return id_response.json()

    async def run(self):
        return await self._fetch_replays()
