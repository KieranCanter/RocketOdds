# Calculateda

This `calculateda` CLI tool is used to perform exploratory data analysis on the RocketOdds data stored in an S3 bucket.

## Installation

You can use either of the following commands to install the `calculateda` package, which in turn will install all necessary dependencies:

```bash
pip install .
```

```bash
pip install -r requirements.txt
```

Then create a `.env` file in the `calculateda/` directory following the `.env.example` file.

## Usage

```bash
calculateda <subcommand> <subcommand-args>
```

### Run

```bash
calculateda run <run-args>
```

run-args:

- `-L`, `--log-path`: Path to log file (default: `./log/calculateda.log`)
- `-v`, `--verbose`: Enable verbose logging
