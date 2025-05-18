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
        res = {}
        res["id"] = replay.get("id", None)
        res["link"] = replay.get("link", None)
        res["created"] = replay.get("created", None)
        res["steam_id"] = replay.get("uploader", {}).get("steam_id", None)
        res["name"] = replay.get("uploader", {}).get("name", None)
        res["rocket_league_id"] = replay.get("rocket_league_id", None)
        res["match_guid"] = replay.get("match_guid", None)
        res["title"] = replay.get("title", None)
        res["map_code"] = replay.get("map_code", None)
        res["map_name"] = replay.get("map_name", None)
        res["team_size"] = replay.get("team_size", None)
        res["playlist_id"] = replay.get("playlist_id", None)
        res["duration"] = replay.get("duration", None)
        res["overtime"] = replay.get("overtime", None)
        res["overtime_seconds"] = replay.get("overtime_seconds", None)
        res["season"] = replay.get("season", None)
        res["date"] = replay.get("date", None)
        res["date_has_timezone"] = replay.get("date_has_timezone", None)
        res["visibility"] = replay.get("visibility", None)
        res["min_rank"] = replay.get("min_rank", None)
        res["max_rank"] = replay.get("max_rank", None)
        for team in ["blue", "orange"]:
            res[team] = {}
            res[team]["players"] = []
            for player in replay.get(team, {}).get("players", []):
                res[team]["players"].append({
                    "start_time": player.get("start_time", None),
                    "end_time": player.get("end_time", None),
                    "name": player.get("name", None),
                    "platform": player.get("id", {}).get("platform", None),
                    "id": player.get("id", {}).get("id", None),
                    "rank": {
                        "id": player.get("rank", {}).get("id", None),
                        "tier": player.get("rank", {}).get("tier", None),
                        "division": player.get("rank", {}).get("division", None),
                        "name": player.get("rank", {}).get("name", None)
                    },
                    "car_id": player.get("car_id", None),
                    "car_name": player.get("car_name", None),
                    "camera": player.get("camera", None),
                    "steering_sensitivity": player.get("steering_sensitivity", None),
                    "stats": player.get("stats", None)
                })
            res[team]["stats"] = replay.get(team, {}).get("stats", None)

        return res

    def run(self, replay: dict) -> dict:
        return self._transform_replay(replay)