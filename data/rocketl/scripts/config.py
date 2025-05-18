from pathlib import Path
import yaml
from dotenv import dotenv_values

class Config:
    def __init__(self) -> None:
        self.yaml = self._load_yaml()
        self.env = self._load_env()

    def _load_yaml(self) -> dict:
        config_file = Path.cwd() / "config.yaml"

        if not config_file.exists():
            raise FileNotFoundError(
                f"Could not find config.yaml in {config_file}"
            )

        with open(config_file, "r") as file:
            return yaml.safe_load(file) 

    def _load_env(self) -> dict:
        env_path = Path.cwd() / ".env"
        if not env_path.exists():
            raise FileNotFoundError(
                f"Could not find .env in {env_path}"
            )
        return dotenv_values(dotenv_path=env_path)

    def get_yaml(self) -> dict:
        return self.yaml
    
    def get_ballchasing_api_key(self) -> str:
        return self.env["BALLCHASING_API_KEY"]
    
    def get_aws_credentials(self) -> dict:
        return {
            "aws_data_access_key": self.env["AWS_DATA_ACCESS_KEY"],
            "aws_data_secret_key": self.env["AWS_DATA_SECRET_KEY"],
            "aws_region": self.env["AWS_REGION"],
            "aws_data_bucket_name": self.env["AWS_DATA_BUCKET_NAME"],
        }