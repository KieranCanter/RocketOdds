import os
from dotenv import load_dotenv
from pathlib import Path
import psycopg2
import boto3

load_dotenv(dotenv_path=Path(__file__).parent.parent.parent / ".env")

def load_to_postgres():

    conn = psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
    )

    print("Connected to database")
    conn.close()


def load_to_s3(data, date, playlist, rank):
    s3_client = boto3.client(
        's3',
        aws_access_key_id=os.getenv("AWS_ACCESS_KEY"),
        aws_secret_access_key=os.getenv("AWS_SECRET_KEY"),
        region_name=os.getenv("AWS_REGION")
    )

    filepath = f"{date.strftime('%Y')}/{date.strftime('%m')}/{date.strftime('%d')}/{playlist}/{date.strftime('%Y-%m-%d')}_{playlist}_{rank}.json"

    response = s3_client.put_object(Bucket="rocketodds-bucket", Key=filepath, Body=data, StorageClass="DEEP_ARCHIVE")

    if response["ResponseMetadata"]["HTTPStatusCode"] == 200:
        print(f"Successfully uploaded {filepath} to S3 with ETag: {response['ETag']}\n")
    else:
        print(f"Failed to upload {filepath} to S3. Status Code: {response['ResponseMetadata']['HTTPStatusCode']}\n")