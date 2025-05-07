import boto3
import logging

from .config import Config

class ReplayLoader:
    def __init__(self, config: Config, log: logging.Logger):
        self.s3_client = boto3.client(
            's3',
            aws_access_key_id=config.get_aws_credentials()["aws_data_access_key"],
            aws_secret_access_key=config.get_aws_credentials()["aws_data_secret_key"],
            region_name=config.get_aws_credentials()["aws_region"]
        )
        self.log = log

    def load(self, data, date, playlist, rank):
        filepath = f"{date.strftime('%Y')}/{date.strftime('%m')}/{date.strftime('%d')}/{playlist}/{date.strftime('%Y-%m-%d')}_{playlist}_{rank}.json"

        response = self.s3_client.put_object(Bucket="rocketodds-data", Key=filepath, Body=data, StorageClass="STANDARD")

        if response["ResponseMetadata"]["HTTPStatusCode"] == 200:
            self.log.info(f"Successfully uploaded {filepath} to S3 with ETag: {response['ETag']}\n")
        else:
            self.log.error(f"Failed to upload {filepath} to S3. Status Code: {response['ResponseMetadata']['HTTPStatusCode']}\n")
