import gzip
import json

def compress_replays_for_s3(replays):
    json_data = json.dumps(replays)
    compressed_data = gzip.compress(json_data.encode('utf-8'))
    return compressed_data

