import os
import requests
from dotenv import load_dotenv
from pathlib import Path
import yaml
import json
import gzip
import re

load_dotenv(dotenv_path=Path(__file__).parent.parent / ".env")

def load_config():
    with open(Path(__file__).parent.parent / "config.yaml", "r") as file:
        return yaml.safe_load(file)
    
config = load_config()

base_url = config["ballchasing"]["base_url"]
timeout = config["ballchasing"]["timeout"]
ballchasing_api_key = os.getenv("BALLCHASING_API_KEY")

def fetch_all_replays():
    import requests
import time

def fetch_all_replays():
    all_replays = []
    url = f"{base_url}/replays"
    headers = {"Authorization": ballchasing_api_key}
    params = {
        "playlist": {"unranked-duels", "unranked-doubles", "unranked-standard", "ranked-duels", "ranked-doubles", "ranked-solo-standard", "ranked-standard"},
        "sort-by": "replay-date",
    }
    total_matches = 0
    
    while url:
        # Make the request to the current URL
        response = requests.get(f"{base_url}/replays", headers=headers, params=params, timeout=timeout)
        
        if response.status_code == 200:
            data = response.json()
            replays = data.get('data', [])  # List of replays on the current page
            all_replays.extend(replays)
            
            # Check if there is a "next" key for pagination
            url = data.get('next', None)  # If there is a "next" key, update the URL to the next page
            pattern = r"'id': '[0-9a-zA-Z|-]{36}'"
            matches = re.findall(pattern, str(data))
            total_matches += len(matches)
            print(f"Fetched {len(matches)} replays. Total so far: {total_matches}")
            
            # Sleep to stay within the rate limits (for example, 2 requests per second)
            time.sleep(0.5)  # Adjust this sleep time based on your API rate limit
        else:
            print(f"Error fetching replays. Status Code: {response.status_code}")
            break
    
    return all_replays

# Example of fetching all replays and printing the total count
all_replays = fetch_all_replays()
print(f"Total replays fetched: {len(all_replays)}")


def fetch_replay_data():
    headers = {"Authorization": ballchasing_api_key}
    params = {
        "playlist": {"unranked-duels", "unranked-doubles", "unranked-standard", "ranked-duels", "ranked-doubles", "ranked-solo-standard", "ranked-standard"},
        "count": 200,
        "sort-by": "replay-date",
    }
    response = requests.get(f"{base_url}/replays", headers=headers, params=params, timeout=timeout)

    if response.status_code == 200:
        return f"Success!\n{response.json()}"
    else:
        return f"Failed to fetch replay data: {response.status_code}\n{response.json()}"

if __name__ == "__main__":
    print(fetch_all_replays())