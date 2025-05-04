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
import logging
from rich.logging import RichHandler
from argparse import ArgumentParser, ArgumentTypeError

# Config import
from .config import Config

# Extract imports
from .extract import ReplayFetcher
from datetime import datetime, timedelta
import asyncio

# Transform imports
#from transform import compress_replays_for_s3

# Load imports
from .load import load_to_s3

def _get_replay_call_limits(rate_limit: str) -> tuple[int, int]:
    match rate_limit:
        case "grand champion":
            return (16, None)
        case "champion":
            return (8, None)
        case "diamond":
            return (4, 2000)
        case "gold":
            return (2, 1000)
        case "base":
            return (2, 500)
        case _:
            raise ValueError(f"Invalid rate limit entered: {rate_limit}")

def _get_id_call_limits(rate_limit: str) -> tuple[int, int]:
    match rate_limit:
        case "grand champion":
            return (16, None)
        case "champion":
            return (8, None)
        case "diamond":
            return (4, 5000)
        case "gold":
            return (2, 2000)
        case "base":
            return (2, 1000)
        case _:
            raise ValueError(f"Invalid rate limit entered: {rate_limit}")

def run_pipeline(
        lookback: int,
        playlists: list[str],
        ranks: list[str],
        rate_limit: str, 
        upload_to_s3: bool, 
        log: logging.Logger
    ) -> None:
    replays_per_second, replays_per_hour = _get_replay_call_limits(rate_limit)
    ids_per_second, ids_per_hour = _get_id_call_limits(rate_limit)

    ###
    # Step 1: Extract Data from Ballchasing API
    ###
    log.info(f"Running ETL pipeline for {lookback} {'day' if lookback == 1 else 'days'} at the {rate_limit.title()} rate limit{' and uploading to S3' if upload_to_s3 else ''}.")
    log.info(f"Included playlists: {playlists[0]}{', '.join(f'{playlist}' for playlist in playlists[1:])}")
    log.info(f"Included ranks: {ranks[0]}{', '.join(f'{rank}' for rank in ranks[1:])}")

    replay_date = datetime.today()
    total_replays = 0
    for day in range(1, lookback + 1):
        replay_date = datetime.today() - timedelta(days=day)
        daily_replays = []

        for playlist in playlists:
            if playlist.startswith("unranked"):
                ranks_list = [rank for rank in ranks if rank == "unranked"]
            else:
                ranks_list = [rank for rank in ranks if rank != "unranked"]

            for rank in ranks_list:
                fetch_string = f"Fetching replay IDs for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}"

                # Fetch the replay IDs with progress spinner
                with Progress(
                    TimeElapsedColumn(),
                    SpinnerColumn(),
                    TextColumn("[progress.description]{task.description}"),
                ) as progress:
                    progress.add_task(description=fetch_string, total=None)
                    replay_ids = fetch_replay_ids(replay_date, playlist, rank, calls_per_second=replays_per_second, calls_per_hour=replays_per_hour, log=log)
                
                total_replays += len(replay_ids)
                log.info(f"Fetched {len(replay_ids)} replay IDs for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}")
                
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
                        filtered_replays = fetch_replays_by_id(replay_ids, calls_per_second=ids_per_second, calls_per_hour=ids_per_hour, log=log)

                    if filtered_replays:
                        log.info(f"Fetched {len(filtered_replays)} replays for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}\n")
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

        log.info(f"[green]Successfully fetched {total_replays} replays for {replay_date.strftime('%d/%m/%Y')}\n[/green]")

    if lookback == 1:
        time_span = f"{(datetime.today() - timedelta(days=1)).strftime('%d/%m/%Y')}"
    else:
        time_span = f"{(datetime.today() - timedelta(days=lookback)).strftime('%d/%m/%Y')}-{(datetime.today() - timedelta(days=1)).strftime('%d/%m/%Y')}"

    log.info(f"[green]Successfully fetched {total_replays} replays for the past {lookback} " \
                f"{'day' if lookback == 1 else 'days'} ({time_span})[/green]")

def clean_pipeline(log: logging.Logger):
    log.info("Cleaning artifacts")

def pipeline_status(log: logging.Logger):
    log.info("Showing ETL status")

async def run_tests(lookback: int,
        playlists: list[str],
        ranks: list[str],
        rate_limit: str, 
        upload_to_s3: bool, 
        log: logging.Logger
    ) -> None:
    config = Config()
    base_url = config.get_yaml()["ballchasing"]["base_url"]
    headers = {"Authorization": f"{config.get_ballchasing_api_key()}"}
    timeout = config.get_yaml()["ballchasing"]["timeout"]
    replay_rate_limit = _get_replay_call_limits(rate_limit)
    id_rate_limit = _get_id_call_limits(rate_limit)

    ###
    # Step 1: Extract Data from Ballchasing API
    ###
    log.info(f"Running ETL test for {lookback} {'day' if lookback == 1 else 'days'} at the {rate_limit.title()} rate limit{' and uploading to S3' if upload_to_s3 else ''}.")
    log.info(f"Included playlists: {', '.join(f'{playlist}' for playlist in playlists)}")
    log.info(f"Included ranks: {', '.join(f'{rank}' for rank in ranks)}")

    total_replays = 0
    replay_date = datetime.today()
    for day in range(1, lookback + 1):
        replay_date = datetime.today() - timedelta(days=day)
        daily_replays = []

        for playlist in playlists:
            if playlist.startswith("unranked"):
                ranks_list = [rank for rank in ranks if rank == "unranked"]
            else:
                ranks_list = [rank for rank in ranks if rank != "unranked"]

            for rank in ranks_list:
                fetch_string = f"Fetching parameterized replay data for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}"

                # Fetch the parameterized replay data with progress spinner
                with Progress(
                    TimeElapsedColumn(),
                    SpinnerColumn(),
                    TextColumn("[progress.description]{task.description}"),
                ) as progress:
                    progress.add_task(description=fetch_string, total=None)
                    replay_fetcher = ReplayFetcher(
                        base_url=base_url,
                        headers=headers,
                        timeout=timeout,
                        replay_rate_limit=replay_rate_limit,
                        id_rate_limit=id_rate_limit,
                        log=log
                    )
                    replay_fetcher.set_params(playlist, rank, replay_date, 200, "replay-date", "desc")
                    parameterized_replay_data = await replay_fetcher.run()

                if not parameterized_replay_data:
                    log.warning(f"No parameterized replay data found for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}")
                    continue

                log.info(f"[green] Successfully fetched {len(parameterized_replay_data)} replays for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}\n[/green]")
                total_replays += len(parameterized_replay_data)
        
        if upload_to_s3:
            ###
            # Step 2: Transform for S3
            ###
            # TODO: Transform data to prepare for bulk insert

            ###
            # Step 3: Load Data into S3
            ###
            load_to_s3(daily_replays, replay_date, playlist, rank)

    if lookback == 1:
        time_span = f"{(datetime.today() - timedelta(days=1)).strftime('%d/%m/%Y')}"
    else:
        time_span = f"{(datetime.today() - timedelta(days=lookback)).strftime('%d/%m/%Y')}-{(datetime.today() - timedelta(days=1)).strftime('%d/%m/%Y')}"

    log.info(f"[green]Successfully fetched {total_replays} replays for the past {lookback} " \
                f"{'day' if lookback == 1 else 'days'} ({time_span})[/green]")

def _validate_lookback(lookback: int) -> int:
    val = int(lookback)
    if val < 1 or val > 90:
        raise ArgumentTypeError(f"Invalid lookback value: {val}. Please enter a value between 1 and 90, inclusive.")
    return val

def main():
    config_yaml = Config().get_yaml()
    
    playlists = config_yaml["ballchasing"]["playlists"]
    ranks = config_yaml["ballchasing"]["ranks"]["unranked"]
    ranks.extend(config_yaml["ballchasing"]["ranks"]["ranked"])
    
    parser = ArgumentParser(description="RocketOdds ETL CLI tool")
    subparsers = parser.add_subparsers(dest="subcommand", required=True)

    # run subcommand
    run_parser = subparsers.add_parser("run", help="Run the ETL pipeline")
    run_parser.add_argument("-l", "--lookback", type=_validate_lookback, default=90, 
                            help="Number of days back to fetch replays for (default: 90)")
    run_parser.add_argument("-p", "--playlists", type=str, default=playlists,
                            nargs="*",
                            choices=playlists,
                            metavar="playlist-name",
                            help="Playlists to fetch replays for (default: all)")
    run_parser.add_argument("-r", "--ranks", type=str, default=ranks,
                            nargs="*",
                            choices=ranks,
                            metavar="rank-tier",
                            help="Ranks to fetch replays for (default: all)")
    run_parser.add_argument("-rl", "--rate-limit", type=str, default="base",
                            nargs="?",
                            choices=["grand champion", "champion", "diamond", "gold", "base"],
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
    test_parser.add_argument("-l", "--lookback", type=_validate_lookback, default=90, 
                            help="Number of days back to fetch replays for (default: 90)")
    test_parser.add_argument("-p", "--playlists", type=str, default=playlists,
                            nargs="*",
                            choices=playlists,
                            metavar="playlist-name",
                            help="Playlists to fetch replays for (default: all)")
    test_parser.add_argument("-r", "--ranks", type=str, default=ranks,
                            nargs="*",
                            choices=ranks,
                            metavar="rank-tier",
                            help="Ranks to fetch replays for (default: all)")
    test_parser.add_argument("-rl", "--rate-limit", type=str, default="base",
                            nargs="?",
                            choices=["grand champion", "champion", "diamond", "gold", "base"],
                            help="Rate limit for Ballchasing API calls (default: base)")
    test_parser.add_argument("-s3", "--upload-to-s3", action="store_true", 
                            help="Upload to S3")
    test_parser.add_argument("-v", "--verbose", action="store_true", 
                            help="Enable verbose logging")

    args = parser.parse_args()

    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format="%(message)s",
        handlers=[RichHandler(markup=True)]
    )
    log = logging.getLogger("rich")

    match args.subcommand:
        case "run":
            run_pipeline(args.lookback, args.playlists, args.ranks, args.rate_limit, args.upload_to_s3, log=log)
        case "clean":
            clean_pipeline(args.verbose, log=log)
        case "status":
            pipeline_status(args.verbose, log=log)
        case "test":
            asyncio.run(run_tests(args.lookback, args.playlists, args.ranks, args.rate_limit, args.upload_to_s3, log=log))
        case _:
            parser.print_help()

    log.info(f"[green]Finished running etl {args.subcommand}.[/green]")

if __name__ == "__main__":
    main()
