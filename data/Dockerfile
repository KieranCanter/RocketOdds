# data/Dockerfile
FROM python:3.10

WORKDIR /data

RUN apt update && apt install -y \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .