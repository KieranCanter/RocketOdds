import os
from pathlib import Path
import boto3

from .config import load_env

load_env()

def load_to_s3(data, date, playlist, rank):
    s3_client = boto3.client(
        's3',
        aws_access_key_id=os.getenv("AWS_ACCESS_KEY"),
        aws_secret_access_key=os.getenv("AWS_SECRET_KEY"),
        region_name=os.getenv("AWS_REGION")
    )

    filepath = f"{date.strftime('%Y')}/{date.strftime('%m')}/{date.strftime('%d')}/{playlist}/{date.strftime('%Y-%m-%d')}_{playlist}_{rank}.json"

    response = s3_client.put_object(Bucket="rocketodds-data", Key=filepath, Body=data, StorageClass="STANDARD_IA")

    if response["ResponseMetadata"]["HTTPStatusCode"] == 200:
        print(f"Successfully uploaded {filepath} to S3 with ETag: {response['ETag']}\n")
    else:
        print(f"Failed to upload {filepath} to S3. Status Code: {response['ResponseMetadata']['HTTPStatusCode']}\n")