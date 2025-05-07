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

    def _load(self, data_buffer, filepath):
        try:
            response = self.s3_client.put_object(Bucket="rocketodds-data", Key=filepath, Body=data_buffer, StorageClass="STANDARD")
        except Exception as e:
            self.log.error(f"Failed to upload {filepath} to S3. Status Code: "\
                            f"{response['ResponseMetadata']['HTTPStatusCode']}\n")
            raise e

        self.log.info(f"[green]Successfully uploaded {filepath} to S3 with ETag: {response['ETag']}[/green]\n")

    def run(self, transformed_replays, date, playlist, rank):
        data_table = pa.Table.from_pylist(transformed_replays)
        data_buffer = io.BytesIO()
        pq.write_table(data_table, data_buffer)
        data_buffer.seek(0)
        filepath = f"{date.strftime('%Y')}/{date.strftime('%m')}/{date.strftime('%d')}"\
                    f"/{playlist}/{date.strftime('%Y-%m-%d')}_{playlist}_{rank}.parquet"
        self._load(data_buffer, filepath)