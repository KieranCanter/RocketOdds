import os
import requests
from dotenv import load_dotenv
from pathlib import Path
import yaml
import json
import gzip
import time
from datetime import datetime
import pytz
load_dotenv(dotenv_path=Path(__file__).parent.parent / ".env")

def load_config():
    with open(Path(__file__).parent.parent / "config.yaml", "r") as file:
        return yaml.safe_load(file)
    
config = load_config()

base_url = config["ballchasing"]["base_url"]
timeout = config["ballchasing"]["timeout"]
ballchasing_api_key = os.getenv("BALLCHASING_API_KEY")

def fetch_all_replays():
    url = f"{base_url}/replays"
    headers = {"Authorization": ballchasing_api_key}
    params = {
        "playlist": {"unranked-duels", "unranked-doubles", "unranked-standard", "ranked-duels", "ranked-doubles", "ranked-solo-standard", "ranked-standard"},
        "count": 200, # 200 = maximum count allowed by ballchasing, 400 replays/sec up to 100,000 replays/hr
        "sort-by": "replay-date",
        "sort-dir": "desc"
    }

    all_replays = []
    
    for i in range(500): # Max 500 calls/hr
        # Make the request to the current URL
        response = requests.get(url, headers=headers, params=params, timeout=timeout)
        
        if response.status_code == 200:
            data = response.json()
            replays = data.get('list', [])  # List of replays on the current page
            all_replays.extend(replays)
            
            print(f"Fetched {len(replays)} replays. Total so far: {len(all_replays)}")
            if replays[0]['date_has_tz']:
                date = datetime.fromisoformat(replays[0]['date']).astimezone(pytz.timezone('US/Eastern'))
            else:
                date = datetime.fromisoformat(replays[0]['date'].replace("Z", "+00:00")).astimezone(pytz.timezone('US/Eastern'))
            print(f"Date of the first replay of the call: {date}\n")
            
            # Check if there is a "next" key for pagination
            url = data.get('next', None)  # If there is a "next" key, update the URL to the next page
            if not url:
                break

            # Sleep to stay within the 2 call/sec rate limit
            time.sleep(0.5)  # Adjust this sleep time based on your API rate limit
        else:
            print(f"Error fetching replays. Status Code: {response.status_code}")
            break
    
    return all_replays

def fetch_replay_by_season(season):
    url = f"{base_url}/replays"
    headers = {"Authorization": ballchasing_api_key}
    params = {
        "playlist": {"unranked-duels", "unranked-doubles", "unranked-standard", "ranked-duels", "ranked-doubles", "ranked-solo-standard", "ranked-standard"},
        "count": 200, # 200 = maximum count allowed by ballchasing, 400 replays/sec up to 100,000 replays/hr
    }

    all_replays = []
    
    for i in range(500): # Max 500 calls/hr
        # Make the request to the current URL
        response = requests.get(url, headers=headers, params=params, timeout=timeout)
        
        if response.status_code == 200:
            data = response.json()
            replays = data.get('list', [])  # List of replays on the current page
            all_replays.extend(replays)
            
            print(f"Fetched {len(replays)} replays. Total so far: {len(all_replays)}")
            if replays[0]['date_has_tz']:
                date = datetime.fromisoformat(replays[0]['date']).astimezone(pytz.timezone('US/Eastern'))
            else:
                date = datetime.fromisoformat(replays[0]['date'].replace("Z", "+00:00")).astimezone(pytz.timezone('US/Eastern'))
            print(f"Date of the first replay of the call: {date}\n")
            
            # Check if there is a "next" key for pagination
            url = data.get('next', None)  # If there is a "next" key, update the URL to the next page
            if not url:
                break

            # Sleep to stay within the 2 call/sec rate limit
            time.sleep(0.5)  # Adjust this sleep time based on your API rate limit
        else:
            print(f"Error fetching replays. Status Code: {response.status_code}")
            break
    
    return all_replays

if __name__ == "__main__":
    playlists = [ "unranked-duels", "unranked-doubles", "unranked-standard",
        "ranked-duels", "ranked-doubles", "ranked-solo-standard", "ranked-standard"
    ]

    headers = {"Authorization": ballchasing_api_key}
    response = requests.get(f"{base_url}/replays/442e44d6-9924-4e28-a8ef-6bbd7bccb380", headers=headers, timeout=timeout)
    print(json.dumps(response.json(), indent=4))

    #print(fetch_all_replays())