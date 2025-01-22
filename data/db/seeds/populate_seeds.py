import requests
from pathlib import Path
import os
import yaml
from dotenv import load_dotenv
from datetime import datetime
import pytz

load_dotenv(dotenv_path=Path(__file__).parent.parent.parent.parent / ".env")

class BallchasingSeeder:

    def __init__(self, api_key):
        self.api_key = api_key
        self.headers = {'Authorization': api_key}
        self.output_dir = Path(__file__).parent
        
        config = yaml.safe_load(open(Path(__file__).parent.parent.parent.parent / "config.yaml", "r"))
        self.BASE_URL = config["ballchasing"]["base_url"]
        self.TIMEOUT = config["ballchasing"]["timeout"]

    def fetch_replay(self, replay_id):
        response = requests.get(f'{self.BASE_URL}/replays/{replay_id}', headers=self.headers, timeout=self.TIMEOUT)
        if response.status_code == 200:
            return response.json()
        else:
            raise Exception(f"Failed to fetch replay: {response.status_code}")

    def _write_sql(self, filename: str, sql_statements: list[str]) -> None:
        filepath = self.output_dir / filename
        with open(filepath, 'a') as f:
            # Find the common leading whitespace for each statement
            cleaned_statements = []
            for stmt in sql_statements:
                lines = stmt.splitlines()
                # Find the minimum indentation level (excluding empty lines)
                min_indent = min(len(line) - len(line.lstrip()) for line in lines if line.strip())
                # Remove only the common indentation
                cleaned = '\n'.join(
                    line[min_indent:] if line.strip() else ''
                    for line in lines
                )
                cleaned_statements.append(cleaned)
            
            f.write('\n'.join(cleaned_statements))

    # Convert datetime to EST timezone in SQL-valid format 'YYYY-MM-DD HH:MM:SS EST'
    def _convert_time_to_sql_est(self, datetime_str, is_created_date=False):
        if is_created_date:
            if 'Z' in datetime_str:  # UTC time
                stripped_datetime = datetime.strptime(datetime_str, '%Y-%m-%dT%H:%M:%S.%fZ').replace(tzinfo=pytz.UTC)
            else:  # Time with timezone offset
                stripped_datetime = datetime.strptime(datetime_str[:-6], '%Y-%m-%dT%H:%M:%S.%f')
                hours_offset = int(datetime_str[-6:-3])  # Get the hours offset
                stripped_datetime = stripped_datetime.replace(tzinfo=pytz.FixedOffset(hours_offset * 60))  # Convert offset to minutes
        else:
            if 'Z' in datetime_str:  # UTC time
                stripped_datetime = datetime.strptime(datetime_str, '%Y-%m-%dT%H:%M:%SZ').replace(tzinfo=pytz.UTC)
            else:  # Time with timezone offset
                stripped_datetime = datetime.strptime(datetime_str[:-6], '%Y-%m-%dT%H:%M:%S')
                hours_offset = int(datetime_str[-6:-3])  # Get the hours offset
                stripped_datetime = stripped_datetime.replace(tzinfo=pytz.FixedOffset(hours_offset * 60))  # Convert offset to minutes
    
        # Convert to EST
        est_datetime = stripped_datetime.astimezone(pytz.timezone('America/New_York'))
        formatted_datetime = est_datetime.strftime('%Y-%m-%d %H:%M:%S EST')
        return formatted_datetime

    def generate_sql_files(self, replay_data):
        # Create separate SQL files for each table
        self.generate_uploaders_sql(replay_data)
        self.generate_replays_sql(replay_data)
        self.generate_teams_sql(replay_data)
        # team_stats is generated in the teams_sql function
        self.generate_players_sql(replay_data)
        # replay_players and player_stats are generated in the players_sql function

    def generate_uploaders_sql(self, replay_data):
        sql = []
        
        sql.append(f"""
            INSERT INTO uploaders (steam_id, uploader_name, profile_url) 
            VALUES (
                '{replay_data['uploader']['steam_id']}',
                '{replay_data['uploader']['name'].replace("'", "''")}',
                '{replay_data['uploader']['profile_url']}'
            );
        """)

        self._write_sql('V1_seed_uploaders.sql', sql)

    def generate_replays_sql(self, replay_data):
        sql = []

        sql.append(f"""
            INSERT INTO replays (
                replay_id, link, created, uploader_id, rocket_league_id, match_guid, 
                title, map_code, map_name, team_size, playlist_id, duration, overtime, overtime_seconds, 
                season, match_date, visibility) 
            VALUES (
                '{replay_data['id']}',
                '{replay_data['link']}',
                '{self._convert_time_to_sql_est(replay_data['created'], is_created_date=True)}',
                '{replay_data['uploader']['steam_id']}',
                '{replay_data['rocket_league_id']}',
                '{replay_data['match_guid']}',
                '{replay_data['title']}',
                '{replay_data['map_code']}',
                '{replay_data['map_name']}',
                {replay_data.get('team_size', -1)},
                '{replay_data['playlist_id']}',
                {replay_data.get('duration', -1)},
                {str(replay_data['overtime']).lower()},
                {replay_data.get('overtime_seconds', -1)},
                {replay_data['season']},
                '{self._convert_time_to_sql_est(replay_data['date'])}',
                '{replay_data['visibility']}'
            );
        """)

        self._write_sql('V2_seed_replays.sql', sql)

    def generate_teams_sql(self, replay_data):
        sql = []
        replay_id = replay_data['id']
        
        for team_color in ['blue', 'orange']:
            team_name = replay_data[team_color].get('name', 'Unnamed Team')
            
            sql.append(f"""
                INSERT INTO teams (replay_id, team_color, team_name)
                VALUES (
                    {replay_id},
                    {team_color},
                    {team_name}
                );
            """)

            self.generate_team_stats_sql(replay_data, team_color)

        self._write_sql('V3_seed_teams.sql', sql)
    
    def generate_team_stats_sql(self, replay_data, team_color):
        team_ball_stats_sql = []
        team_core_stats_sql = []
        team_boost_stats_sql = []
        team_movement_stats_sql = []
        team_positioning_stats_sql = []
        team_demo_stats_sql = []
        replay_id = replay_data['id']

        team_data = replay_data[team_color]['stats']
            
        team_ball_stats_sql.append(f"""
            INSERT INTO team_ball_stats (replay_id, team_color, possession_time, time_in_side) 
            VALUES (
                {replay_id},
                {team_color},
                {team_data['ball']['possession_time']},
                {team_data['ball'].get('time_in_side', -1)}
            );
        """)

        team_core_stats_sql.append(f"""
            INSERT INTO team_core_stats (
                replay_id, team_color, shots, shots_against, goals, goals_against, saves, assists, score, 
                shooting_percentage) 
            VALUES (
                {replay_id},
                {team_color},
                {team_data['core']['shots']},
                {team_data['core']['shots_against']},
                {team_data['core']['goals']},
                {team_data['core']['goals_against']},
                {team_data['core']['saves']},
                {team_data['core']['assists']},
                {team_data['core']['score']},
                {team_data['core']['shooting_percentage']}
            );
        """)

        team_boost_stats_sql.append(f"""
            INSERT INTO team_boost_stats (
                replay_id, team_color, bpm, bcpm, avg_amount, amount_collected, amount_stolen, 
                amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
                count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
                amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, time_full_boost, 
                time_boost_0_25, time_boost_25_50, time_boost_50_75, time_boost_75_100) 
            VALUES (
                {replay_id},
                {team_color},
                {team_data['boost']['bpm']},
                {team_data['boost']['bcpm']},
                {team_data['boost']['avg_amount']},
                {team_data['boost']['amount_collected']},
                {team_data['boost']['amount_stolen']},
                {team_data['boost']['amount_collected_big']},
                {team_data['boost']['amount_stolen_big']},
                {team_data['boost']['amount_collected_small']},
                {team_data['boost']['amount_stolen_small']},
                {team_data['boost']['count_collected_big']},
                {team_data['boost']['count_stolen_big']},
                {team_data['boost']['count_collected_small']},
                {team_data['boost']['count_stolen_small']},
                {team_data['boost']['amount_overfill']},
                {team_data['boost']['amount_overfill_stolen']},
                {team_data['boost']['amount_used_while_supersonic']},
                {team_data['boost']['time_zero_boost']},
                {team_data['boost']['time_full_boost']},
                {team_data['boost']['time_boost_0_25']},
                {team_data['boost']['time_boost_25_50']},
                {team_data['boost']['time_boost_50_75']},
                {team_data['boost']['time_boost_75_100']}
            );
        """)

        team_movement_stats_sql.append(f"""
            INSERT INTO team_movement_stats (replay_id, team_color, total_distance, time_supersonic_speed, 
                time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
                count_powerslide) 
            VALUES (
                {replay_id},
                {team_color},
                {team_data['movement']['total_distance']},
                {team_data['movement']['time_supersonic_speed']},
                {team_data['movement']['time_boost_speed']},
                {team_data['movement']['time_slow_speed']},
                {team_data['movement']['time_ground']},
                {team_data['movement']['time_low_air']},
                {team_data['movement']['time_high_air']},
                {team_data['movement']['time_powerslide']},
                {team_data['movement']['count_powerslide']}
            );
        """)

        team_positioning_stats_sql.append(f"""
            INSERT INTO team_positioning_stats (replay_id, team_color, time_defensive_third, time_neutral_third, 
                time_offensive_third, time_defensive_half, time_offensive_half, time_behind_ball, 
                time_infront_ball) 
            VALUES (
                {replay_id},
                {team_color},
                {team_data['positioning']['time_defensive_third']},
                {team_data['positioning']['time_neutral_third']},
                {team_data['positioning']['time_offensive_third']},
                {team_data['positioning']['time_defensive_half']},
                {team_data['positioning']['time_offensive_half']},
                {team_data['positioning']['time_behind_ball']},
                {team_data['positioning']['time_infront_ball']}
            );
        """)

        team_demo_stats_sql.append(f"""
            INSERT INTO team_demo_stats (replay_id, team_color, inflicted, taken) 
            VALUES (
                {replay_id},
                {team_color},
                {team_data['demo']['inflicted']},
                {team_data['demo']['taken']}
            );
        """)

        self._write_sql('V4_seed_team_stats.sql', team_ball_stats_sql)
        self._write_sql('V4_seed_team_stats.sql', team_core_stats_sql)
        self._write_sql('V4_seed_team_stats.sql', team_boost_stats_sql)
        self._write_sql('V4_seed_team_stats.sql', team_movement_stats_sql)
        self._write_sql('V4_seed_team_stats.sql', team_positioning_stats_sql)
        self._write_sql('V4_seed_team_stats.sql', team_demo_stats_sql)


    def generate_players_sql(self, replay_data):
        sql = []
        replay_id = replay_data['id']
        
        for team_color in ['blue', 'orange']:
            for player in replay_data[team_color]['players']:
                # Add defensive checking for the id structure
                platform = player['id'].get('platform', '')  # Use get() with default value
                player_id_value = player['id'].get('id', '')  # Fallback to string representation
                
                sql.append(f"""
                    INSERT INTO players (player_id, platform, name) 
                    VALUES (
                        {player_id_value},
                        {platform},
                        {player['name']}
                    );
                """)

                self.generate_replay_players_sql(replay_id, player, team_color)
                self.generate_player_stats_sql(replay_id, player)

        self._write_sql('V5_seed_players.sql', sql)

    def generate_replay_players_sql(self, replay_id, player_data, team_color):
        sql = []

        sql.append(f"""
            INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
                mvp, car_id, car_name, start_time, end_time) 
            VALUES (
                {player_data['id'].get('id', '')},
                {replay_id},
                {team_color},
                {'Unranked' if player_data.get('rank', 'Unranked') == 'Unranked' else player_data['rank']['id']},
                {-1 if player_data.get('rank', 'Unranked') == 'Unranked' else player_data['rank']['tier']},
                {-1 if player_data.get('rank', 'Unranked') == 'Unranked' else player_data['rank']['division']},
                {str(player_data.get('mvp', False)).lower()},
                {player_data['car_id']},
                {player_data.get('car_name', '')},
                {player_data['start_time']},
                {player_data['end_time']},
            );
        """)

        self._write_sql('V6_seed_replay_players.sql', sql)

    def generate_player_stats_sql(self, replay_id, player_data):
        player_settings_sql = []
        player_core_stats_sql = []
        player_boost_stats_sql = []
        player_movement_stats_sql = []
        player_positioning_stats_sql = []
        player_demo_stats_sql = []
        player_stats = player_data['stats']

        player_settings_sql.append(f"""
            INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
                swivel_speed, transition_speed, steering_sensitivity) 
            VALUES (
                {player_data['id'].get('id', '')},
                {replay_id},
                {player_data['camera']['fov']},
                {player_data['camera']['height']},
                {player_data['camera']['pitch']},
                {player_data['camera']['distance']},
                {player_data['camera']['stiffness']},
                {player_data['camera']['swivel_speed']},
                {player_data['camera']['transition_speed']},
                {player_data['steering_sensitivity']}
            );
        """)

        player_core_stats_sql.append(f"""
            INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
                assists, score, shooting_percentage) 
            VALUES (
                {player_data['id'].get('id', '')},
                {replay_id},
                {player_stats['core']['shots']},
                {player_stats['core']['shots_against']},
                {player_stats['core']['goals']},
                {player_stats['core']['goals_against']},
                {player_stats['core']['saves']},
                {player_stats['core']['assists']},
                {player_stats['core']['score']},
                {player_stats['core']['shooting_percentage']}
            );
        """)

        player_boost_stats_sql.append(f"""
            INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
                amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
                count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
                amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
                time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
                time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
            VALUES (
                {player_data['id'].get('id', '')},
                {replay_id},
                {player_stats['boost']['bpm']},
                {player_stats['boost']['bcpm']},
                {player_stats['boost']['avg_amount']},
                {player_stats['boost']['amount_collected']},
                {player_stats['boost']['amount_stolen']},
                {player_stats['boost']['amount_collected_big']},
                {player_stats['boost']['amount_stolen_big']},
                {player_stats['boost']['amount_collected_small']},
                {player_stats['boost']['amount_stolen_small']},
                {player_stats['boost']['count_collected_big']},
                {player_stats['boost']['count_stolen_big']},
                {player_stats['boost']['count_collected_small']},
                {player_stats['boost']['count_stolen_small']},
                {player_stats['boost']['amount_overfill']},
                {player_stats['boost']['amount_overfill_stolen']},
                {player_stats['boost']['amount_used_while_supersonic']},
                {player_stats['boost']['time_zero_boost']},
                {player_stats['boost']['percent_zero_boost']},
                {player_stats['boost']['time_full_boost']},
                {player_stats['boost']['percent_full_boost']},
                {player_stats['boost']['time_boost_0_25']},
                {player_stats['boost']['time_boost_25_50']},
                {player_stats['boost']['time_boost_50_75']},
                {player_stats['boost']['time_boost_75_100']},
                {player_stats['boost']['percent_boost_0_25']},
                {player_stats['boost']['percent_boost_25_50']},
                {player_stats['boost']['percent_boost_50_75']},
                {player_stats['boost']['percent_boost_75_100']}
            );
        """)

        player_movement_stats_sql.append(f"""
            INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
                time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
                count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
                percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
            VALUES (
                {player_data['id'].get('id', '')},
                {replay_id},
                {player_stats['movement']['avg_speed']},
                {player_stats['movement']['total_distance']},
                {player_stats['movement']['time_supersonic_speed']},
                {player_stats['movement']['time_boost_speed']},
                {player_stats['movement']['time_slow_speed']},
                {player_stats['movement']['time_ground']},
                {player_stats['movement']['time_low_air']},
                {player_stats['movement']['time_high_air']},
                {player_stats['movement']['time_powerslide']},
                {player_stats['movement']['count_powerslide']},
                {player_stats['movement']['avg_powerslide_duration']},
                {player_stats['movement']['avg_speed_percentage']},
                {player_stats['movement']['percent_slow_speed']},
                {player_stats['movement']['percent_boost_speed']},
                {player_stats['movement']['percent_supersonic_speed']},
                {player_stats['movement']['percent_ground']},
                {player_stats['movement']['percent_low_air']},
                {player_stats['movement']['percent_high_air']}
            );
        """)

        player_positioning_stats_sql.append(f"""
            INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
                avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
                time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
                time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
                goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
                percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
                percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
                percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
            VALUES (
                {player_data['id'].get('id', '')},
                {replay_id},
                {player_stats['positioning']['avg_distance_to_ball']},
                {player_stats['positioning']['avg_distance_to_ball_possession']},
                {player_stats['positioning']['avg_distance_to_ball_no_possession']},
                {player_stats['positioning'].get('avg_distance_to_mates', -1)},
                {player_stats['positioning']['time_defensive_third']},
                {player_stats['positioning']['time_neutral_third']},
                {player_stats['positioning']['time_offensive_third']},
                {player_stats['positioning']['time_defensive_half']},
                {player_stats['positioning']['time_offensive_half']},
                {player_stats['positioning']['time_behind_ball']},
                {player_stats['positioning']['time_infront_ball']},
                {player_stats['positioning']['time_most_back']},
                {player_stats['positioning']['time_most_forward']},
                {player_stats['positioning'].get('goals_against_while_last_defender', -1)},
                {player_stats['positioning']['time_closest_to_ball']},
                {player_stats['positioning']['time_farthest_from_ball']},
                {player_stats['positioning']['percent_defensive_third']},
                {player_stats['positioning']['percent_neutral_third']},
                {player_stats['positioning']['percent_offensive_third']},
                {player_stats['positioning']['percent_defensive_half']},
                {player_stats['positioning']['percent_offensive_half']},
                {player_stats['positioning']['percent_behind_ball']},
                {player_stats['positioning']['percent_infront_ball']},
                {player_stats['positioning']['percent_most_back']},
                {player_stats['positioning']['percent_most_forward']},
                {player_stats['positioning']['percent_closest_to_ball']},
                {player_stats['positioning']['percent_farthest_from_ball']}
            );
        """)

        player_demo_stats_sql.append(f"""
            INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
            VALUES (
                {player_data['id'].get('id', '')},
                {replay_id},
                {player_stats['demo']['inflicted']},
                {player_stats['demo']['taken']}
            );
        """)

        self._write_sql('V7_seed_player_stats.sql', player_settings_sql)
        self._write_sql('V7_seed_player_stats.sql', player_core_stats_sql)
        self._write_sql('V7_seed_player_stats.sql', player_boost_stats_sql)
        self._write_sql('V7_seed_player_stats.sql', player_movement_stats_sql)
        self._write_sql('V7_seed_player_stats.sql', player_positioning_stats_sql)
        self._write_sql('V7_seed_player_stats.sql', player_demo_stats_sql)


if __name__ == '__main__':
    
    BALLCHASING_API_KEY = os.getenv("BALLCHASING_API_KEY")
    seeder = BallchasingSeeder(BALLCHASING_API_KEY)
    
    # Clear all seed files before starting
    seed_files = [
        'V1_seed_uploaders.sql',
        'V2_seed_replays.sql',
        'V3_seed_teams.sql',
        'V4_seed_team_stats.sql',
        'V5_seed_players.sql',
        'V6_seed_replay_players.sql',
        'V7_seed_player_stats.sql'
    ]

    for file in seed_files:
        with open(seeder.output_dir / file, 'w') as f:
            f.write('')

    # Hardcoded replays to generate seed data
    replay_ids = [
        '9d37f8dd-3598-49b7-967c-9a013ecf5f74', # Ranked 1v1
        '32341018-395a-446d-a3a7-cc213598cf7f', # Ranked 2v2
        '2852f730-8d9d-4658-b7cd-77bff44cde15', # Ranked 3v3
        'fc54e2d6-1c9e-4479-9169-e4d02b185c13', # Unranked 4v4
        'a4676587-9373-401b-9de1-5ea48839f574', # Unranked 3v3
        '238ca3d7-3b3d-4680-a53b-79516e9066ac', # Ranked 2v2 (duplicate players)
    ]
    
    for replay_id in replay_ids:
        for file in seed_files:
            with open(seeder.output_dir / file, 'a') as f:
                f.write('-- Seed data for replay: ' + replay_id + '\n')

        replay_data = seeder.fetch_replay(replay_id)
        seeder.generate_sql_files(replay_data)

        for file in seed_files:
            with open(seeder.output_dir / file, 'a') as f:
                f.write('\n' + '-- End seed data for replay: ' + replay_id + '\n\n\n\n')