import asyncio
import httpx
from aiolimiter import AsyncLimiter
import logging
from contextlib import AsyncExitStack
from urllib.parse import urlparse, parse_qs

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
                    replays_response = await self.client.get(url, params=self.params)
                    replays_response.raise_for_status()
                except httpx.HTTPStatusError as e:
                    if e.response.status_code == 429:
                        self.log.warning(f"Status Code {e.response.status_code} rate limit exceeded. Waiting {e.response.headers.get('Retry-After')} seconds...")
                        await asyncio.sleep(int(e.response.headers.get('Retry-After', 10)))
                        continue
                    else:
                        self.log.error(f"HTTP status error fetching replays. Status Code {e.response.status_code}: {e.response.text}\n")
                        raise e
                except httpx.TimeoutException:
                    self.log.error(f"Timeout error fetching replays\n")
                    raise e
                except httpx.RequestError as e:
                    self.log.error(f"Non-HTTP error fetching replays. Status Code {e.response.status_code}: {e.response.text}\n")
                    raise e
                
                self.log.info(f"There are {replays_response.json().get('count', -1)} replays in this query")
                for replay in replays_response.json().get('list', []):
                    id_response = await self._fetch_id_stats(replay.get('id'))
                    replay_data.append(id_response)
                    self.log.info(f"Fetch number {len(replay_data)}")

                next_url = replays_response.json().get('next', None)
                if next_url:
                    after = parse_qs(urlparse(next_url).query).get('after', None)
                    self.log.info(f"After: {after}")
                    self.params['after'] = after
                else:
                    url = None

        self.log.info(f"Fetched {len(replay_data)} replays for {self.params['playlist']} in {self.params['min-rank']} on {self.params['replay-date-after'][:10]}")
        return replay_data

    async def _fetch_id_stats(self, replay_id):
        limiters = [self.id_secondly_limiter]
        if self.id_hourly_limiter:
            limiters.append(self.id_hourly_limiter)

        url = f"{self.base_url}/replays/{replay_id}"

        async with AsyncExitStack() as stack:
            # Enter all limiters contexts
            for limiter in limiters:
                await stack.enter_async_context(limiter)
            
            try:
                id_response = await self.client.get(url)
                id_response.raise_for_status()
            except httpx.HTTPStatusError as e:
                if e.response.status_code == 429:
                    self.log.warning(f"Status Code {e.response.status_code} rate limit exceeded. Waiting {e.response.headers.get('Retry-After')} seconds...")
                    await asyncio.sleep(int(e.response.headers.get('Retry-After', 10)))
                    return await self._fetch_id_stats(replay_id)
                else:
                    self.log.error(f"HTTP status error fetching replay ID {replay_id}. Status Code {e.response.status_code}: {e.response.text}\n")
                    raise e
            except httpx.TimeoutException:
                self.log.error(f"Timeout error fetching replay ID {replay_id}\n")
                raise e
            except httpx.RequestError as e:
                self.log.error(f"Non-HTTP error fetching replay ID {replay_id}. Status Code {e.response.status_code}: {e.response.text}\n")
                raise e
            
            self.log.debug(f"Fetched replay ID {replay_id}")
            return id_response.json()

    async def run(self):
        return await self._fetch_replays()
