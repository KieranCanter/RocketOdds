import boto3
import logging
import pyarrow as pa
import pyarrow.parquet as pq
import io

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

    def _load(self, data_buffer, key_path):
        try:
            response = self.s3_client.put_object(Bucket="rocketodds-data", Key=key_path, Body=data_buffer, StorageClass="STANDARD")
        except Exception as e:
            self.log.error(f"Failed to upload {key_path} to S3. Status Code: "\
                            f"{response['ResponseMetadata']['HTTPStatusCode']}\n")
            raise e

    def run(self, transformed_replays, date, playlist):
        data_table = pa.Table.from_pylist(transformed_replays)
        data_buffer = io.BytesIO()
        pq.write_table(data_table, data_buffer)
        data_buffer.seek(0)
        key_path = f"{date.strftime('%Y')}/{date.strftime('%m')}/{date.strftime('%d')}"\
                    f"/{date.strftime('%Y-%m-%d')}-{playlist}.parquet"
        self._load(data_buffer, key_path)