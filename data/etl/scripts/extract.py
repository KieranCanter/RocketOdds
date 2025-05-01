import os
import requests
from dotenv import load_dotenv
from pathlib import Path
import yaml
import time
from rich.console import Console
from .config import load_config, load_env

load_env()
config = load_config()
console = Console()

BASE_URL = config["ballchasing"]["base_url"]
TIMEOUT = config["ballchasing"]["timeout"]
BALLCHASING_API_KEY = os.getenv("BALLCHASING_API_KEY")

def fetch_replay_ids(replay_date, playlist, rank, calls_per_second=2, calls_per_hour=500):
    formatted_date_start = replay_date.strftime("%Y-%m-%dT00:00:00Z")
    formatted_date_end = replay_date.strftime("%Y-%m-%dT23:59:59Z")

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
    
    while True:
        # Check hourly rate limit
        if calls_per_hour and hourly_request_count >= calls_per_hour:
            wait_time = 3600 - (time.time() - last_request_time)
            if wait_time > 0:
                console.log(f"Hourly rate limit reached after {len(daily_replay_ids)} replays. Waiting {wait_time:.2f} seconds...", style="yellow")
                time.sleep(wait_time)
            hourly_request_count = 0
            last_request_time = time.time()

        # Max calls/sec
        time_between_calls = 1 / calls_per_second
        elapsed = time.time() - last_request_time
        if elapsed < time_between_calls:
            time.sleep(time_between_calls - elapsed)

        # Make the request to the current URL
        response = requests.get(url, headers=headers, params=params, timeout=TIMEOUT)
        hourly_request_count += 1
        last_request_time = time.time()
        
        if response.status_code == 200:
            replay_data = response.json()
            replays = replay_data.get('list', [])  # List of replays on the current page
            for replay in replays:
                id = replay.get('id')
                daily_replay_ids.append(id)
            
            # Check if there is a "next" key for pagination
            url = replay_data.get('next', None)  # If there is a "next" key, update the URL to the next page
            if not url:
                break

            # Sleep to stay within the 2 call/sec rate limit
            time.sleep(time_between_calls)

        elif response.status_code == 429:
            retry_after = int(response.headers.get('Retry-After', 3600))
            console.log(f"Rate limit exceeded. Waiting {retry_after} seconds...", style="yellow")
            time.sleep(retry_after)
            # Dont break, retry same request

        else:
            raise Exception(f"Error fetching replay IDs for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}. Status Code: {response.status_code}\n")

    return daily_replay_ids

def fetch_replays_by_id(replay_ids, calls_per_second=2, calls_per_hour=500):
    daily_replays = []
    headers = {"Authorization": BALLCHASING_API_KEY}
    hourly_request_count = 0
    last_request_time = time.time()
    
    for replay_id in replay_ids:
        # Check hourly rate limit
        if calls_per_hour and hourly_request_count >= calls_per_hour:
            wait_time = 3600 - (time.time() - last_request_time)
            if wait_time > 0:
                console.log(f"Hourly rate limit reached after {len(daily_replays)} replays. Waiting {wait_time:.2f} seconds...", style="yellow")
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
            console.log(f"Rate limit exceeded. Waiting {retry_after} seconds...", style="yellow")
            time.sleep(retry_after)
            # Dont break, retry same request

        else:
            raise Exception(f"Error fetching replay {replay_id}. Status Code: {response.status_code}\n")

    return daily_replays