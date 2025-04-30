###
# Run ETL pipeline
###

import sys
import time
import yaml
from pathlib import Path
import json
from rich.progress import Progress, SpinnerColumn, TimeElapsedColumn, TextColumn
from rich import print as rprint
from rich.console import Console
from argparse import ArgumentParser

# Extract imports
from .extract import fetch_replay_ids, fetch_replays_by_id
from datetime import datetime, timedelta

# Transform imports
#from transform import compress_replays_for_s3

# Load imports
from .load import load_to_postgres, load_to_s3

def load_config():
    with open(Path(__file__).parent.parent.parent.parent / "config.yaml", "r") as file:
        return yaml.safe_load(file)

def run_pipeline(args: ArgumentParser) -> None:
    ###
    # Step 1: Extract Data from Ballchasing API
    ###
    rprint("Running ETL pipeline")
    return
    lookback = args.lookback
    upload_to_s3 = args.upload_to_s3
    
    config = load_config()
    playlists = config["ballchasing"]["playlists"]
    ranks = config["ballchasing"]["ranks"]
    replay_date = datetime.today()

    total_replays = 0
    for day in range(lookback + 1):
        replay_date = datetime.today() - timedelta(days=day)
        daily_replays = []

        for playlist in playlists:
            ranks_list = ranks["unranked"] if playlist.startswith("unranked") else ranks["ranked"]

            for rank in ranks_list:
                fetch_string = f"Fetching replay IDs for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}"

                # Fetch the replay IDs with progress spinner
                with Progress(
                    TimeElapsedColumn(),
                    SpinnerColumn(),
                    TextColumn("[progress.description]{task.description}"),
                ) as progress:
                    progress.add_task(description=fetch_string, total=None)
                    replay_ids = fetch_replay_ids(replay_date, playlist, rank, calls_per_second=2, calls_per_hour=500)
                
                total_replays += len(replay_ids)
                rprint(f"Fetched {len(replay_ids)} replay IDs for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}")
                
                # Get in-depth replay data for each replay ID
                if replay_ids:
                    fetch_string = f"Fetching {len(replay_ids)} replays for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}"

                    # Fetch replays with progress spinner
                    with Progress(
                        TimeElapsedColumn(),
                        SpinnerColumn(),
                        TextColumn("[progress.description]{task.description}"),
                    ) as progress:
                        progress.add_task(description=fetch_string, total=None)
                        filtered_replays = fetch_replays_by_id(replay_ids, calls_per_second=2, calls_per_hour=500)

                    if filtered_replays:
                        rprint(f"Fetched {len(filtered_replays)} replays for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}\n")
                        daily_replays.extend(filtered_replays)

        if upload_to_s3:
            ###
            # Step 2: Transform for Postgres
            ###
            # TODO: Transform data to prepare for bulk insert

            ###
            # Step 3: Load Data into Postgres
            ###
            load_to_postgres(daily_replays)

        rprint(f"Finished fetching {total_replays} replays for {'today' if day == 0 else {'day back' if day == 1 else 'days back'}} ({replay_date.strftime('%Y-%m-%d')})\n")
    
    with open("test_data.json", "w") as file:
        json.dump(daily_replays, file)

    rprint(f"Finished fetching {total_replays} replays for the past {lookback} {'days' if lookback > 1 else 'day'}")

def clean_pipeline(args: ArgumentParser):
    rprint("Cleaning artifacts")

def pipeline_status(args: ArgumentParser):
    rprint("Showing ETL status")

def run_tests(args: ArgumentParser):
    rprint("Running ETL tests")

def main():
    parser = ArgumentParser(description="ETL CLI tool")
    subparsers = parser.add_subparsers(dest="subcommand", required=True)

    # run subcommand
    run_parser = subparsers.add_parser("run", help="Run the ETL pipeline")
    run_parser.add_argument("-l", "--lookback", type=int, default=90, 
                            help="Number of days back to fetch replays for (default: 90)")
    run_parser.add_argument("-s3", "--upload-to-s3", action="store_true", 
                            help="Upload to S3")
    run_parser.add_argument("-v", "--verbose", action="store_true", 
                            help="Enable verbose logging")
    run_parser.set_defaults(func=run_pipeline)

    # clean subcommand
    clean_parser = subparsers.add_parser("clean", help="Clean artifacts")
    clean_parser.set_defaults(func=clean_pipeline)

    # status subcommand
    status_parser = subparsers.add_parser("status", help="Show ETL status")
    status_parser.set_defaults(func=pipeline_status)

    # test subcommand
    test_parser = subparsers.add_parser("test", help="Run ETL tests")
    test_parser.set_defaults(func=run_tests)

    args = parser.parse_args()
    args.func(args)

    rprint("Finished running pipeline")
    console = Console()
    console.log("Finished running pipeline")

if __name__ == "__main__":
    main()