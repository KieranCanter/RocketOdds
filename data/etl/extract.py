import os
import requests
from dotenv import load_dotenv
from pathlib import Path
import yaml
import json
import time

load_dotenv(dotenv_path=Path(__file__).parent.parent / ".env")

def load_config():
    with open(Path(__file__).parent.parent / "config.yaml", "r") as file:
        return yaml.safe_load(file)
    
config = load_config()

base_url = config["ballchasing"]["base_url"]
timeout = config["ballchasing"]["timeout"]
ballchasing_api_key = os.getenv("BALLCHASING_API_KEY")

def fetch_replays(replay_date, playlist, rank):
    print(f"Fetching replays for {replay_date.strftime('%Y-%m-%d')}_{playlist}_{rank}.json...")

    formatted_date_start = replay_date.strftime("%Y-%m-%dT00:00:00Z")
    formatted_date_end = replay_date.strftime("%Y-%m-%dT23:59:59Z")

    url = f"{base_url}/replays"
    headers = {"Authorization": ballchasing_api_key}
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

    all_replays = []
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
        response = requests.get(url, headers=headers, params=params, timeout=timeout)
        hourly_request_count += 1
        last_request_time = time.time()
        
        if response.status_code == 200:
            data = response.json()
            replays = data.get('list', [])  # List of replays on the current page
            all_replays.extend(replays)
            
            # Check if there is a "next" key for pagination
            url = data.get('next', None)  # If there is a "next" key, update the URL to the next page
            if not url:
                break

            # Sleep to stay within the 2 call/sec rate limit
            time.sleep(0.5)  # Adjust this sleep time based on your API rate limit
        elif response.status_code == 429:
            retry_after = int(response.headers.get('Retry-After', 3600))
            print(f"Rate limit exceeded. Waiting {retry_after} seconds...")
            time.sleep(retry_after)
            # Dont break, retry same request
        else:
            print(f"Error fetching replays for {replay_date.strftime('%Y-%m-%d')}_{playlist}_{rank}.\
                  Status Code: {response.status_code}")
            break
    
    print(f"Fetched {len(all_replays)} replays.")

    return all_replays