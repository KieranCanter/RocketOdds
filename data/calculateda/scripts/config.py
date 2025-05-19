from pathlib import Path
from dotenv import dotenv_values

class Config:
    def __init__(self) -> None:
        self.env = self._load_env()

    def _load_env(self) -> dict:
        env_path = Path.cwd() / ".env"
        if not env_path.exists():
            raise FileNotFoundError(
                f"Could not find .env in {env_path}"
            )
        return dotenv_values(dotenv_path=env_path)

    def get_aws_credentials(self) -> dict:
        return {
            "aws_data_access_key": self.env["AWS_DATA_ACCESS_KEY"],
            "aws_data_secret_key": self.env["AWS_DATA_SECRET_KEY"],
            "aws_region": self.env["AWS_REGION"],
            "aws_data_bucket_name": self.env["AWS_DATA_BUCKET_NAME"],
            "aws_models_bucket_name": self.env["AWS_MODELS_BUCKET_NAME"]
        }