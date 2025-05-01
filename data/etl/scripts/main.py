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

# Config import
from .config import load_config

# Extract imports
from .extract import fetch_replay_ids, fetch_replays_by_id
from datetime import datetime, timedelta

# Transform imports
#from transform import compress_replays_for_s3

# Load imports
from .load import load_to_s3

console = Console()

def validate_rate_limit(rate_limit: str) -> str:
    if not rate_limit:
        console.log("No rate limit specified, using base rate limit.")
        return "base"
    
    rate_limit = rate_limit.lower()
    match rate_limit:
        case "gc" | "grand champ" | "grand champion":
            return "gc"
        case "c" | "champ" | "champion":
            return "c"
        case "d" | "diamond":
            return "d"
        case "g" | "gold":
            return "g"
        case "base":
            return "base"
        case _:
            raise ValueError(f"Invalid rate limit entered: {rate_limit}. Please choose one of the following or leave blank for the base rate limit: gc/grand champ/grand champion, c/champ/champion, d/diamond, g/gold, base")

def get_replay_call_limits(rate_limit: str) -> tuple[int, int]:
    match rate_limit:
        case "gc" | "grand champ" | "grand champion":
            return (16, None)
        case "c" | "champ" | "champion":
            return (8, None)
        case "d" | "diamond":
            return (4, 2000)
        case "g" | "gold":
            return (2, 1000)
        case _:
            return (2, 500)

def get_id_call_limits(rate_limit: str) -> tuple[int, int]:
    match rate_limit:
        case "gc" | "grand champ" | "grand champion":
            return (16, None)
        case "c" | "champ" | "champion":
            return (8, None)
        case "d" | "diamond":
            return (4, 5000)
        case "g" | "gold":
            return (2, 2000)
        case _:
            return (2, 1000)

def run_pipeline(lookback: int, rate_limit: str, upload_to_s3: bool, verbose: bool) -> None:
    rate_limit = validate_rate_limit(rate_limit)
    replays_per_second, replays_per_hour = get_replay_call_limits(rate_limit)
    ids_per_second, ids_per_hour = get_id_call_limits(rate_limit)
    
    ###
    # Step 1: Extract Data from Ballchasing API
    ###
    console.log(f"Running ETL pipeline for {lookback} {'day' if lookback == 1 else 'days'} at the {rate_limit.title()} rate limit {' and uploading to S3' if upload_to_s3 else ''}.")
    if verbose:
        console.log(locals())
    
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
                    replay_ids = fetch_replay_ids(replay_date, playlist, rank, calls_per_second=replays_per_second, calls_per_hour=replays_per_hour)
                
                total_replays += len(replay_ids)
                console.log(f"Fetched {len(replay_ids)} replay IDs for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}")
                
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
                        filtered_replays = fetch_replays_by_id(replay_ids, calls_per_second=ids_per_second, calls_per_hour=ids_per_hour)

                    if filtered_replays:
                        console.log(f"Fetched {len(filtered_replays)} replays for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}\n")
                        daily_replays.extend(filtered_replays)

        if upload_to_s3:
            ###
            # Step 2: Transform for S3
            ###
            # TODO: Transform data to prepare for bulk insert

            ###
            # Step 3: Load Data into S3
            ###
            load_to_s3(daily_replays, replay_date, playlist, rank)

        console.log(f"Successfully fetched {total_replays} replays for {'today' if day == 0 else {'day back' if day == 1 else 'days back'}} ({replay_date.strftime('%Y-%m-%d')})\n", style="green")
    
    with open("test_data.json", "w") as file:
        json.dump(daily_replays, file)

    console.log(f"Successfully fetched {total_replays} replays for the past {lookback} {'day' if lookback == 1 else 'days'}", style="green")

def clean_pipeline(verbose: bool):
    console.log("Cleaning artifacts")

def pipeline_status(verbose: bool):
    console.log("Showing ETL status")

def run_tests(verbose: bool):
    console.log("Running ETL tests")

def main():
    parser = ArgumentParser(description="RocketOdds ETL CLI tool")
    subparsers = parser.add_subparsers(dest="subcommand", required=True)

    # run subcommand
    run_parser = subparsers.add_parser("run", help="Run the ETL pipeline")
    run_parser.add_argument("-l", "--lookback", type=int, default=90, 
                            help="Number of days back to fetch replays for (default: 90)")
    run_parser.add_argument("-r", "--rate-limit", type=str, nargs="?", default="base",
                            help="Rate limit for Ballchasing API calls (default: base)")
    run_parser.add_argument("-s3", "--upload-to-s3", action="store_true", 
                            help="Upload to S3")
    run_parser.add_argument("-v", "--verbose", action="store_true", 
                            help="Enable verbose logging")
    # clean subcommand
    clean_parser = subparsers.add_parser("clean", help="Clean artifacts")
    clean_parser.add_argument("-v", "--verbose", action="store_true", 
                            help="Enable verbose logging")

    # status subcommand
    status_parser = subparsers.add_parser("status", help="Show ETL status")
    status_parser.add_argument("-v", "--verbose", action="store_true", 
                            help="Enable verbose logging")

    # test subcommand
    test_parser = subparsers.add_parser("test", help="Run ETL tests")
    test_parser.add_argument("-v", "--verbose", action="store_true", 
                            help="Enable verbose logging")

    args = parser.parse_args()
    match args.subcommand:
        case "run":
            run_pipeline(args.lookback, args.rate_limit, args.upload_to_s3, args.verbose)
        case "clean":
            clean_pipeline(args.verbose)
        case "status":
            pipeline_status(args.verbose)
        case "test":
            run_tests(args.verbose)
        case _:
            parser.print_help()

    console.log("Finished running etl {args.subcommand}.")

if __name__ == "__main__":
    main()