###
# Run ETL pipeline
###

import sys
import yaml
from pathlib import Path

# Extract imports
from extract import fetch_replays
from datetime import datetime, timedelta

# Transform imports
from transform import compress_replays_for_s3

# Load imports
from load import load_to_postgres, load_to_s3

def load_config():
    with open(Path(__file__).parent.parent.parent / "config.yaml", "r") as file:
        return yaml.safe_load(file)
    

def pipeline(days_back: int, upload_to_postgres: bool, upload_to_s3: bool) -> None:
    ###
    # Step 1: Extract Data from Ballchasing API
    ###
    
    config = load_config()
    playlists = config["ballchasing"]["playlists"]
    ranks = config["ballchasing"]["ranks"]
    replay_date = datetime.today()

    total_replays = 0
    for day in range(days_back + 1):
        replay_date = datetime.today() - timedelta(days=day)
        daily_replays = []

        for playlist in playlists:
            ranks_list = ranks["unranked"] if playlist.startswith("unranked") else ranks["ranked"]

            for rank in ranks_list:
                replays = fetch_replays(replay_date, playlist, rank)
                total_replays += len(replays)

                print(f"Fetched {len(replays)} replays for {playlist} - {rank} on {replay_date.strftime('%Y-%m-%d')}")
                
                if replays:
                    if upload_to_postgres:
                        daily_replays.extend(replays)

                    if upload_to_s3:
                        ###
                        # Step 2: Transform for S3
                        ###
                        compressed_replays = compress_replays_for_s3(replays)

                        ###
                        # Step 3: Load Data into S3
                        ###
                        load_to_s3(compressed_replays, replay_date, playlist, rank)

        if upload_to_postgres:
            ###
            # Step 2: Transform for Postgres
            ###
            # TODO: any proper transformations needed to load into postgres

            ###
            # Step 3: Load Data into Postgres
            ###
            load_to_postgres(daily_replays)

        print(f"Finished fetching {total_replays} replays for {'today' if day == 0 else {'day back' if day == 1 else 'days back'}} ({replay_date.strftime('%Y-%m-%d')})\n")

    print(f"Finished fetching {total_replays} replays for the past {days_back} {'days' if days_back > 1 else 'day'}")


if __name__ == "__main__":
    if not (2 <= len(sys.argv) <= 4):
        print("Error: Invalid number of arguments")
        print("Usage: python3 main.py <days_back: int> [--postgres] [--s3]")
        sys.exit(1)
    if not sys.argv[1].isdigit() or int(sys.argv[1]) < 1:
        print("Error: days_back must be a positive integer")
        print("Usage: python3 main.py <days_back: int> [--postgres] [--s3]")
        sys.exit(1)

    days_back = int(sys.argv[1])

    upload_to_postgres = False
    upload_to_s3 = False

    if "--postgres" in sys.argv:
        upload_to_postgres = True

    if "--s3" in sys.argv:
        upload_to_s3 = True
    
    print(f"Running pipeline for the past {days_back} {'days' if days_back > 1 else 'day'}")
    if upload_to_postgres and upload_to_s3:
        print("Uploading to Postgres and S3\n")
    elif upload_to_postgres:
        print("Uploading to Postgres\n")
    elif upload_to_s3:
        print("Uploading to S3\n")
    else:
        print("Not uploading to Postgres or S3\n")
    
    pipeline(days_back=days_back, upload_to_postgres=upload_to_postgres, upload_to_s3=upload_to_s3)

    print("Finished running pipeline")