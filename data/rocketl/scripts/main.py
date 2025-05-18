###
# Run ETL pipeline
###

from rich.progress import Progress, SpinnerColumn, TimeElapsedColumn, TextColumn
from rich.logging import RichHandler
import logging
from logging.handlers import RotatingFileHandler
from argparse import ArgumentParser, ArgumentTypeError
from datetime import datetime, timedelta
import asyncio
from pathlib import Path

from .config import Config
from .extract import ReplayFetcher
from .transform import ReplayTransformer
from .load import ReplayLoader

class Pipeline:
    def __init__(self, lookback: int, playlists: list[str], rate_limit: str, upload_to_s3: bool, log: logging.Logger):
        self.config = Config()
        self.lookback = lookback
        self.playlists = playlists
        self.rate_limit = rate_limit
        self.upload_to_s3 = upload_to_s3
        self.log = log

        self.replay_fetcher = ReplayFetcher(self.config, self.rate_limit, self.log)
        self.replay_transformer = ReplayTransformer(self.config, self.log)
        self.replay_loader = ReplayLoader(self.config, self.log)

    async def _run_extract(self, playlist: str, replay_date: datetime, log_suffix: str) -> list[dict]:
        fetch_string = f"Fetching parameterized replay data {log_suffix}"

        with Progress(
            TimeElapsedColumn(),
            SpinnerColumn(),
            TextColumn("[progress.description]{task.description}"),
        ) as progress:
            progress.add_task(description=fetch_string, total=None)
            self.replay_fetcher.set_params(playlist, replay_date, 200, "replay-date", "desc")
            parameterized_replays = await self.replay_fetcher.run()

            if not parameterized_replays:
                self.log.warning(f"No parameterized replay data found {log_suffix}")
                return []

            self.log.info(f"[green]Successfully fetched {len(parameterized_replays)} "\
                    f"{'replay' if len(parameterized_replays) == 1 else 'replays'} "\
                    f"{log_suffix}[/green]")

        return parameterized_replays

    def _run_transform(self, parameterized_replays: list[dict], log_suffix: str) -> list[dict]:
        transform_string = f"Transforming {len(parameterized_replays)} "\
                        f"{'replay' if len(parameterized_replays) == 1 else 'replays'} "\
                        f"{log_suffix}"

        # Transform the parameterized replay data
        with Progress(
            TimeElapsedColumn(),
            SpinnerColumn(),
            TextColumn("[progress.description]{task.description}"),
        ) as progress:
            progress.add_task(description=transform_string, total=None)
            transformed_replays = []
            for parameterized_replay in parameterized_replays:
                transformed_replay = self.replay_transformer.run(parameterized_replay)
                transformed_replays.append(transformed_replay)
                del parameterized_replay

            del parameterized_replays
            self.log.info(f"[green]Successfully transformed {len(transformed_replays)} "\
                    f"{'replay' if len(transformed_replays) == 1 else 'replays'} "\
                    f"{log_suffix}[/green]")

        return transformed_replays

    def _run_load(self, transformed_replays: list[dict], replay_date: datetime, playlist: str, log_suffix: str) -> None:
        load_string = f"Loading {len(transformed_replays)} "\
                    f"{'replay' if len(transformed_replays) == 1 else 'replays'} "\
                    f"{log_suffix} to S3"

        with Progress(
            TimeElapsedColumn(),
            SpinnerColumn(),
            TextColumn("[progress.description]{task.description}"),
        ) as progress:
            progress.add_task(description=load_string, total=None)
            self.replay_loader.run(transformed_replays, replay_date, playlist)

        self.log.info(f"[green]Successfully loaded {len(transformed_replays)} "\
                f"{'replay' if len(transformed_replays) == 1 else 'replays'} "\
                f"{log_suffix} to S3[/green]")

        del transformed_replays

    async def run(self) -> None:
        # Step 1: Extract Data from Ballchasing API
        self.log.info(f"Running ETL pipeline for {self.lookback} {'day' if self.lookback == 1 else 'days'} at the "\
                f"{self.rate_limit.title()} rate limit{' and uploading to S3' if self.upload_to_s3 else ''}.")
        self.log.info(f"Included playlists: {', '.join(f'{playlist}' for playlist in self.playlists)}")

        total_replays = 0
        replay_date = datetime.today()
        for day in range(1, self.lookback + 1):
            replay_date = datetime.today() - timedelta(days=day)

            for playlist in self.playlists:
                log_suffix = f"for {playlist} on {replay_date.strftime('%Y-%m-%d')}"

                # Fetch the parameterized replay data
                parameterized_replays = await self._run_extract(playlist, replay_date, log_suffix)
                total_replays += len(parameterized_replays)

                if self.upload_to_s3:
                    # Step 2: Transform the parameterized replay data
                    transformed_replays = self._run_transform(parameterized_replays, log_suffix)
                    # Step 3: Load the transformed replay data into S3
                    self._run_load(transformed_replays, replay_date, playlist, log_suffix)

        if self.lookback == 1:
            time_span = f"{(datetime.today() - timedelta(days=1)).strftime('%d/%m/%Y')}"
        else:
            time_span = f"{(datetime.today() - timedelta(days=self.lookback)).strftime('%d/%m/%Y')}-{(datetime.today() - timedelta(days=1)).strftime('%d/%m/%Y')}"

        self.log.info(f"[green]Successfully processed {total_replays} replays for the past {self.lookback} " \
                    f"{'day' if self.lookback == 1 else 'days'} ({time_span})[/green]")

def _validate_lookback(lookback: int) -> int:
    val = int(lookback)
    if val < 1 or val > 90:
        raise ArgumentTypeError(f"Invalid lookback value: {val}. Please enter a value between 1 and 90, inclusive.")
    return val

def _setup_logger(log_path: str, verbose: bool) -> logging.Logger:
    Path(log_path).parent.mkdir(parents=True, exist_ok=True)

    log = logging.getLogger()
    log.setLevel(logging.DEBUG if verbose else logging.INFO)
    log.handlers.clear()

    rich_handler = RichHandler(
        rich_tracebacks=True,
        markup=True,
        log_time_format="%Y-%m-%d %H:%M:%S"
    )

    max_file_size = 10 * 1024 * 1024  # 10 MB
    file_handler = RotatingFileHandler(log_path, mode="a", maxBytes=max_file_size, backupCount=3, encoding="utf-8")
    file_handler.setLevel(logging.DEBUG if verbose else logging.INFO)
    file_formatter = logging.Formatter(
        fmt="%(asctime)s    %(levelname)s    %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S"
    )
    file_handler.setFormatter(file_formatter)

    log.addHandler(rich_handler)
    log.addHandler(file_handler)

    return log

def main():
    config_yaml = Config().get_yaml()
    
    playlists = config_yaml["ballchasing"]["playlists"]
    
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
    run_parser.add_argument("-r", "--rate-limit", type=str, default="base",
                            nargs="?",
                            choices=["grand champion", "champion", "diamond", "gold", "base"],
                            help="Rate limit for Ballchasing API calls (default: base)")
    run_parser.add_argument("-s3", "--upload-to-s3", action="store_true", 
                            help="Upload to S3")
    run_parser.add_argument("-L", "--log-path", type=str, default="./log/rocketl.log",
                            help="Path to log file (default: ./log/rocketl.log)")
    run_parser.add_argument("-v", "--verbose", action="store_true", 
                            help="Enable verbose logging")

    # More subcommands can go here
    args = parser.parse_args()

    log = _setup_logger(args.log_path, args.verbose)

    match args.subcommand:
        case "run":
            pipeline = Pipeline(args.lookback, args.playlists, args.rate_limit, args.upload_to_s3, log=log)
            asyncio.run(pipeline.run())
        # More subcommands can go here
        case _:
            parser.print_help()

    log.info(f"[green]Finished running rocketl {args.subcommand}.[/green]")

if __name__ == "__main__":
    main()
