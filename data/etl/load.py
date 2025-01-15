import os
from dotenv import load_dotenv
from pathlib import Path
import psycopg2
import boto3

load_dotenv(dotenv_path=Path(__file__).parent.parent / ".env")

def load_to_postgres():

    conn = psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
    )

    print("Connected to database")
    conn.close()


def load_to_s3():
    s3_client = boto3.client(
        's3',
        aws_access_key_id=os.getenv("AWS_ACCESS_KEY"),
        aws_secret_access_key=os.getenv("AWS_SECRET_KEY"),
        region_name=os.getenv("AWS_REGION")
    )

    print("Existing bucket:")
    for bucket in s3_client.list_buckets()['Buckets']:
        print(f'  {bucket["Name"]}')

if __name__ == "__main__":
    load_to_postgres()
    load_to_s3()
