import gzip
import json
import pytz
from datetime import datetime

# Convert datetime to EST timezone in SQL-valid format 'YYYY-MM-DD HH:MM:SS EST'
def _convert_time_to_sql_est(self, datetime_str, is_created_date=False):
    format_str = '%Y-%m-%dT%H:%M:%S.%f' if is_created_date else '%Y-%m-%dT%H:%M:%S'
    
    if 'Z' in datetime_str:  # UTC time
        stripped_datetime = datetime.strptime(datetime_str.replace('Z', ''), format_str).replace(tzinfo=pytz.UTC)
    else:  # Time with timezone offset
        stripped_datetime = datetime.strptime(datetime_str[:-6], format_str)
        hours_offset = int(datetime_str[-6:-3])  # Get the hours offset
        stripped_datetime = stripped_datetime.replace(tzinfo=pytz.FixedOffset(hours_offset * 60))
    
    # Convert to EST
    est_datetime = stripped_datetime.astimezone(pytz.timezone('America/New_York'))
    return est_datetime.strftime('%Y-%m-%d %H:%M:%S EST')

def flatten_replays_to_tables(replays):
    # TODO: Flatten replays into tables
    return replays

