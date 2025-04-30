from pathlib import Path
import yaml
from dotenv import load_dotenv

def load_config():
    config_path = Path(__file__).parent.parent.parent.parent
    config_file = config_path / "config.yaml"

    if not config_file.exists():
        raise FileNotFoundError(
            f"Could not find config.yaml in {config_path}"
        )

    with open(config_file, "r") as file:
        return yaml.safe_load(file) 

def load_env():
    env_path = Path(__file__).parent.parent.parent.parent / ".env"
    if not env_path.exists():
        raise FileNotFoundError(
            f"Could not find .env in {env_path}"
        )
    load_dotenv(dotenv_path=env_path)