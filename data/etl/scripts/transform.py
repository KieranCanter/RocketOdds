from datetime import datetime, timezone
import logging

from .config import Config

class ReplayTransformer:
    def __init__(self, config: Config, log: logging.Logger):
        self.config = config
        self.log = log

    # Convert date string to UTC datetime in ISO 8601 format YYYY-MM-DD HH:MM:SS+00:00
    def _convert_to_utc_datetime(self, datetime_str) -> datetime:
        if not datetime_str:
            return None

        # Format string for datetime conversion, handle microseconds if present
        format_str = '%Y-%m-%dT%H:%M:%S%z' if "." not in datetime_str else '%Y-%m-%dT%H:%M:%S.%f%z'
        date = datetime.strptime(datetime_str, format_str)
        if date.tzinfo != timezone.utc:
            date = date.astimezone(timezone.utc)
        return date

    def _transform_replay(self, replay: dict) -> dict:
        # Pop unneeded fields, rename and flatten some fields, and convert dates to UTC datetimes
        replay["upload_date"] = self._convert_to_utc_datetime(replay.pop("created", None))
        for key in replay.get("uploader", {}).keys():
            if key == "steam_id" or key == "name":
                replay[key] = replay["uploader"].get(key, None)
        replay.pop("uploader", None)
        replay.pop("status", None)
        replay.pop("match_type", None)
        replay.pop("season_type", None)
        replay["match_date"] = self._convert_to_utc_datetime(replay.pop("date", None))
        replay.pop("date", None)
        replay.pop("date_has_timezone", None)
        replay.get("min_rank", {}).pop("name", None)
        replay.get("max_rank", {}).pop("name", None)
        replay.pop("playlist_name", None)
        replay.pop("map_name", None)
        replay.pop("server", None)
        for team in ["blue", "orange"]:
            replay[team].pop("color", None)
            for player in replay.get(team, {}).get("players", []):
                player["name"] = player.get("name", None)
                player["platform"] = player.get("id", {}).pop("platform", None)
                player["id"] = player.get("id", {}).pop("id", None)
                player.pop("id", None)
                player.pop("mvp", None)
                player.get("rank", {}).pop("name", None)

        return replay

    def transform(self, replay: dict) -> dict:
        return self._transform_replay(replay)