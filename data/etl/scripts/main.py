import json
###
# Run ETL pipeline
###

from rich.progress import Progress, SpinnerColumn, TimeElapsedColumn, TextColumn
from rich.logging import RichHandler
from argparse import ArgumentParser, ArgumentTypeError
from datetime import datetime, timedelta
import asyncio
import logging

from .config import Config
from .extract import ReplayFetcher
from .transform import ReplayTransformer
from .load import ReplayLoader

async def run_extract(lookback: int, playlists: list[str], ranks: list[str], rate_limit: str, log: logging.Logger) -> None:
    pass

async def run_pipeline(
        lookback: int,
        playlists: list[str],
        ranks: list[str],
        rate_limit: str, 
        upload_to_s3: bool, 
        log: logging.Logger
    ) -> None:
    config = Config()

    replay_fetcher = ReplayFetcher(
        config=config,
        rate_limit=rate_limit,
        log=log
    )

    replay_transformer = ReplayTransformer(config, log)

    replay_loader = ReplayLoader(config, log)

    ###
    # Step 1: Extract Data from Ballchasing API
    ###
    log.info(f"Running ETL test for {lookback} {'day' if lookback == 1 else 'days'} at the "\
            f"{rate_limit.title()} rate limit{' and uploading to S3' if upload_to_s3 else ''}.")
    log.info(f"Included playlists: {', '.join(f'{playlist}' for playlist in playlists)}")
    log.info(f"Included ranks: {', '.join(f'{rank}' for rank in ranks)}")

    total_replays = 0
    replay_date = datetime.today()
    for day in range(1, lookback + 1):
        replay_date = datetime.today() - timedelta(days=day)

        for playlist in playlists:
            if playlist.startswith("unranked"):
                ranks_list = [rank for rank in ranks if rank == "unranked"]
            else:
                ranks_list = [rank for rank in ranks if rank != "unranked"]

            for rank in ranks_list:
                fetch_string = f"Fetching parameterized replay data for {rank} in {playlist} "\
                                f"on {replay_date.strftime('%Y-%m-%d')}"

                # Fetch the parameterized replay data
                with Progress(
                    TimeElapsedColumn(),
                    SpinnerColumn(),
                    TextColumn("[progress.description]{task.description}"),
                ) as progress:
                    progress.add_task(description=fetch_string, total=None)
                    replay_fetcher.set_params(playlist, rank, replay_date, 200, "replay-date", "desc")
                    parameterized_replays = await replay_fetcher.run()

                    if not parameterized_replays:
                        log.warning(f"No parameterized replay data found for {rank} in {playlist} "\
                                    f"on {replay_date.strftime('%Y-%m-%d')}")
                        continue

                    log.info(f"[green] Successfully fetched {len(parameterized_replays)} "\
                            f"{'replay' if len(parameterized_replays) == 1 else 'replays'} "\
                            f"for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}\n[/green]")
                    total_replays += len(parameterized_replays)

                if upload_to_s3:
                    transform_string = f"Transforming {len(parameterized_replays)} "\
                                    f"{'replay' if len(parameterized_replays) == 1 else 'replays'} "\
                                    f"for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}"

                    # Transform the parameterized replay data
                    with Progress(
                        TimeElapsedColumn(),
                        SpinnerColumn(),
                        TextColumn("[progress.description]{task.description}"),
                    ) as progress:
                        progress.add_task(description=transform_string, total=None)
                        transformed_replays = []
                        for parameterized_replay in parameterized_replays:
                            ###
                            # Step 2: Transform for S3
                            ###
                            transformed_replay = replay_transformer.transform(parameterized_replay)
                            transformed_replays.append(transformed_replay)
                            del parameterized_replay

                        del parameterized_replays
                        log.info(f"[green] Successfully transformed {len(transformed_replays)} "\
                                f"{'replay' if len(transformed_replays) == 1 else 'replays'} "\
                                f"for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')}\n[/green]")

                    ###
                    # Step 3: Load Data into S3
                    ###
                    load_string = f"Loading {len(transformed_replays)} "\
                                f"{'replay' if len(transformed_replays) == 1 else 'replays'} "\
                                f"for {rank} in {playlist} on {replay_date.strftime('%Y-%m-%d')} to S3"
                    with Progress(
                        TimeElapsedColumn(),
                        SpinnerColumn(),
                        TextColumn("[progress.description]{task.description}"),
                    ) as progress:
                        progress.add_task(description=load_string, total=None)
                        replay_loader.load(transformed_replays)
                        del transformed_replays


    if lookback == 1:
        time_span = f"{(datetime.today() - timedelta(days=1)).strftime('%d/%m/%Y')}"
    else:
        time_span = f"{(datetime.today() - timedelta(days=lookback)).strftime('%d/%m/%Y')}-{(datetime.today() - timedelta(days=1)).strftime('%d/%m/%Y')}"

    log.info(f"[green]Successfully processed {total_replays} replays for the past {lookback} " \
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
    log.info("Running tests")

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
    run_parser.add_argument("-l", "--lookback", type=_validate_lookback, default=1, 
                            help="Number of days back to fetch replays for (default: 1)")
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
    test_parser.add_argument("-l", "--lookback", type=_validate_lookback, default=1, 
                            help="Number of days back to fetch replays for (default: 1)")
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
            asyncio.run(run_pipeline(args.lookback, args.playlists, args.ranks, args.rate_limit, args.upload_to_s3, log=log))
        case "clean":
            clean_pipeline(args.verbose, log=log)
        case "status":
            pipeline_status(args.verbose, log=log)
        case "test":
            run_tests(args.lookback, args.playlists, args.ranks, args.rate_limit, args.upload_to_s3, log=log)
        case _:
            parser.print_help()

    log.info(f"[green]Finished running etl {args.subcommand}.[/green]")

if __name__ == "__main__":
    main()
