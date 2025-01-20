###
# Run ETL pipeline
###

import sys

# Extract imports
from extract import fetch_replays
from datetime import datetime, timedelta

# Transform imports
from transform import compress_replays_for_s3

# Load imports
from load import load_to_postgres, load_to_s3

def pipeline(days_back: int, upload_to_postgres: bool, upload_to_s3: bool) -> None:
    ###
    # Step 1: Extract Data from Ballchasing API
    ###
    playlists = [ "unranked-duels", "unranked-doubles", "unranked-standard", "unranked-chaos",
            "ranked-duels", "ranked-doubles", "ranked-standard"
        ]

    ranks = ["unranked", "bronze-1", "bronze-2", "bronze-3", "silver-1", "silver-2", "silver-3", "gold-1", "gold-2", "gold-3", "platinum-1", "platinum-2", "platinum-3", "diamond-1", "diamond-2", "diamond-3", "champion-1", "champion-2", "champion-3", "grand-champion-1", "grand-champion-2", "grand-champion-3", "supersonic-legend"]

    replay_date = datetime.today()

    total_replays = 0
    for days_back in range(days_back):
        replay_date = datetime.today() - timedelta(days=days_back)
        for playlist in playlists:
            if playlist.startswith("unranked"):
                replays = fetch_replays(replay_date, playlist, "unranked")
                total_replays += len(replays)
                if upload_to_s3:
                    compressed_replays = compress_replays_for_s3(replays)
                    load_to_s3(compressed_replays, replay_date, playlist, "unranked")
            else:
                for rank in ranks:
                    replays = fetch_replays(replay_date, playlist, rank)
                    total_replays += len(replays)
                    if upload_to_s3:
                        compressed_replays = compress_replays_for_s3(replays)
                        load_to_s3(compressed_replays, replay_date, playlist, rank)
    
    print(f"Finished fetching: fetched {total_replays} replays.")


if __name__ == "__main__":
    if not (2 <= len(sys.argv) <= 4):
        print("Error: Invalid number of arguments")
        print("Usage: python3 main.py <days_back> [--postgres] [--s3]")
        sys.exit(1)
    if not sys.argv[1].isdigit() or int(sys.argv[1]) < 1:
        print("Error: days_back must be a positive integer")
        print("Usage: python3 main.py <days_back> [--postgres] [--s3]")
        sys.exit(1)

    days_back = int(sys.argv[1])

    upload_to_postgres = False
    upload_to_s3 = False

    if "--postgres" in sys.argv:
        upload_to_postgres = True

    if "--s3" in sys.argv:
        upload_to_s3 = True
    
    print(f"Running pipeline for {days_back} {'days' if days_back > 1 else 'day'} back")
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