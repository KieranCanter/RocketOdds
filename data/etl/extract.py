import os
import requests
from dotenv import load_dotenv
from pathlib import Path
import yaml
import time

load_dotenv(dotenv_path=Path(__file__).parent.parent.parent / ".env")

def load_config():
    with open(Path(__file__).parent.parent.parent / "config.yaml", "r") as file:
        return yaml.safe_load(file)
    
config = load_config()

BASE_URL = config["ballchasing"]["base_url"]
TIMEOUT = config["ballchasing"]["timeout"]
BALLCHASING_API_KEY = os.getenv("BALLCHASING_API_KEY")

def fetch_replay_ids(replay_date, playlist, rank):
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
    
    while True: # Max 500 calls/hr
        # Check hourly rate limit
        if hourly_request_count >= 500:
            wait_time = 3600 - (time.time() - last_request_time)
            if wait_time > 0:
                print(f"Hourly rate limit reached. Waiting {wait_time:.2f} seconds...")
                time.sleep(wait_time)
            hourly_request_count = 0
            last_request_time = time.time()

        # Max 2 calls/sec
        elapsed = time.time() - last_request_time
        if elapsed < 0.5:
            time.sleep(0.5 - elapsed)

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
            time.sleep(0.5)  # Adjust this sleep time based on your API rate limit

        elif response.status_code == 429:
            retry_after = int(response.headers.get('Retry-After', 3600))
            print(f"Rate limit exceeded. Waiting {retry_after} seconds...\n")
            time.sleep(retry_after)
            # Dont break, retry same request

        else:
            print(f"Error fetching replay IDs for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}. Status Code: {response.status_code}\n")
            break

    return daily_replay_ids

def fetch_replays_by_id(replay_ids):
    daily_replays = []
    headers = {"Authorization": BALLCHASING_API_KEY}
    hourly_request_count = 0
    last_request_time = time.time()
    
    for replay_id in replay_ids: # Max 1000 calls/hr
        # Check hourly rate limit
        if hourly_request_count >= 1000:
            wait_time = 3600 - (time.time() - last_request_time)
            if wait_time > 0:
                print(f"Hourly rate limit reached. Waiting {wait_time:.2f} seconds...")
                time.sleep(wait_time)
            hourly_request_count = 0
            last_request_time = time.time()

        # Max 2 calls/sec
        elapsed = time.time() - last_request_time
        if elapsed < 0.5:
            time.sleep(0.5 - elapsed)

        # Make the request to the current URL
        url = f"{BASE_URL}/replays/{replay_id}"
        response = requests.get(url, headers=headers, timeout=TIMEOUT)
        hourly_request_count += 1
        last_request_time = time.time()
        
        if response.status_code == 200:
            replay_data = response.json()
            daily_replays.append(replay_data)

            # Sleep to stay within the 2 call/sec rate limit
            time.sleep(0.5)  # Adjust this sleep time based on your API rate limit

        elif response.status_code == 429:
            retry_after = int(response.headers.get('Retry-After', 3600))
            print(f"Rate limit exceeded. Waiting {retry_after} seconds...\n")
            time.sleep(retry_after)
            # Dont break, retry same request

        else:
            print(f"Error fetching replays. Status Code: {response.status_code}\n")
            break

    return daily_replays