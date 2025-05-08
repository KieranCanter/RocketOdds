# ETL Pipeline

This `etl` pipeline CLI tool is used to fetch replays from [ballchasing.com](https://ballchasing.com), transform them, and load them into an S3 bucket as parquet files in order to perform exploratory data analysis and modeling. Edit `config.yaml` to change the list of playlists and ranks that may be collected.

## Installation

You can use either of the following commands to install the `etl` package, which in turn will install all necessary dependencies:

```bash
pip install .
```

```bash
pip install -r requirements.txt
```

## Usage

```bash
etl <subcommand> <subcommand-args>
```

### Run

```bash
etl run <run-args>
```

run-args:

- `-l`, `--lookback`: Number of days back to fetch replays for (default: 1)
- `-p`, `--playlists`: Playlists to fetch replays for (default: all)
- `-r`, `--ranks`: Ranks to fetch replays for (default: all)
- `-rl`, `--rate-limit`: Rate limit for Ballchasing API calls (default: base)
- `-s3`, `--upload-to-s3`: Upload to S3
- `-L`, `--log-path`: Path to log file (default: `./log/etl.log`)
- `-v`, `--verbose`: Enable verbose logging
