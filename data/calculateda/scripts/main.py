###
# Run exploratory data analysis
###

from rich.progress import Progress, SpinnerColumn, TimeElapsedColumn, TextColumn
from rich.logging import RichHandler
import logging
from logging.handlers import RotatingFileHandler
from argparse import ArgumentParser
from pathlib import Path
import polars as pl

from .config import Config

class Pipeline:
    def __init__(self, log: logging.Logger):
        self.log = log

    def run(self):
        aws_credentials = Config().get_aws_credentials()
        bucket_name = aws_credentials["aws_data_bucket_name"]
        storage_options = {
            "aws_access_key_id": aws_credentials["aws_data_access_key"],
            "aws_secret_access_key": aws_credentials["aws_data_secret_key"],
            "aws_region": aws_credentials["aws_region"],
        }

        source = f"s3://{bucket_name}/2025/05/12/2025-05-12-unranked-duels.parquet"
        df = pl.scan_parquet(source, storage_options=storage_options).collect()
        for i in range(0, len(df.columns), 5):
            if i + 5 > len(df.columns):
                end = len(df.columns)
            else:
                end = i + 5
            print(df.select(pl.nth(range(i, end))).tail())
        print(df.columns)

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
    parser = ArgumentParser(description="RocketOdds exploratory data analysis CLI tool")
    subparsers = parser.add_subparsers(dest="subcommand", required=True)

    # run subcommand
    run_parser = subparsers.add_parser("run", help="Run exploratory data analysis")
    run_parser.add_argument("-L", "--log-path", type=str, default="./log/calculateda.log",
                            help="Path to log file (default: ./log/calculateda.log)")
    run_parser.add_argument("-v", "--verbose", action="store_true", 
                            help="Enable verbose logging")

    # More subcommands can go here
    args = parser.parse_args()

    log = _setup_logger(args.log_path, args.verbose)

    match args.subcommand:
        case "run":
            pipeline = Pipeline(log=log)
            pipeline.run()
        # More subcommands can go here
        case _:
            parser.print_help()

    log.info(f"[green]Finished running calculateda {args.subcommand}.[/green]")


if __name__ == "__main__":
    main()