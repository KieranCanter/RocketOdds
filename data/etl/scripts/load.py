import os
from pathlib import Path
import boto3
from rich.console import Console
from .config import Config

config = Config()
console = Console()

def load_to_s3(data, date, playlist, rank):
    aws_credentials = config.get_aws_credentials()
    
    s3_client = boto3.client(
        's3',
        aws_access_key_id=aws_credentials["AWS_ACCESS_KEY"],
        aws_secret_access_key=aws_credentials["AWS_SECRET_KEY"],
        region_name=aws_credentials["AWS_REGION"]
    )

    filepath = f"{date.strftime('%Y')}/{date.strftime('%m')}/{date.strftime('%d')}/{playlist}/{date.strftime('%Y-%m-%d')}_{playlist}_{rank}.json"

    response = s3_client.put_object(Bucket="rocketodds-data", Key=filepath, Body=data, StorageClass="STANDARD_IA")

    if response["ResponseMetadata"]["HTTPStatusCode"] == 200:
        console.log(f"Successfully uploaded {filepath} to S3 with ETag: {response['ETag']}\n", style="green")
    else:
        console.log(f"Failed to upload {filepath} to S3. Status Code: {response['ResponseMetadata']['HTTPStatusCode']}\n", style="red")