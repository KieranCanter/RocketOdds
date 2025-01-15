import os
import requests
from dotenv import load_dotenv
from pathlib import Path
import yaml
import json
import gzip

load_dotenv(dotenv_path=Path(__file__).parent.parent / ".env")

def load_config():
    with open(Path(__file__).parent.parent / "config.yaml", "r") as file:
        return yaml.safe_load(file)
    
config = load_config()

base_url = config["ballchasing"]["base_url"]
timeout = config["ballchasing"]["timeout"]
ballchasing_api_key = os.getenv("BALLCHASING_API_KEY")

def fetch_replay_data():
    headers = {"Authorization": ballchasing_api_key}
    params = {
        "playlist": {"unranked-duels", "unranked-doubles", "unranked-standard", "ranked-duels", "ranked-doubles", "ranked-solo-standard", "ranked-standard"},
        "sort-by": "replay-date",
    }
    response = requests.get(f"{base_url}/replays", headers=headers, params=params, timeout=timeout)

    if response.status_code == 200:
        return f"Success!\n{response.json()}"
    else:
        return f"Failed to fetch replay data: {response.status_code}\n{response.json()}"

if __name__ == "__main__":
    print(fetch_replay_data())