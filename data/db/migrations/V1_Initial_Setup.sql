CREATE SCHEMA IF NOT EXISTS raw_data;

CREATE TABLE IF NOT EXISTS uploaders (
    steam_id VARCHAR(17) PRIMARY KEY,
    uploader_name TEXT NOT NULL,
    profile_url TEXT
);

CREATE TABLE IF NOT EXISTS replays (
    replay_id UUID PRIMARY KEY,
    link TEXT NOT NULL,
    created TIMESTAMP WITH TIME ZONE NOT NULL,
    uploader_id VARCHAR(17) REFERENCES uploaders(steam_id),
    rocket_league_id TEXT,
    match_guid TEXT UNIQUE,
    title TEXT,
    map_code TEXT,
    map_name TEXT,
    team_size SMALLINT CHECK (team_size BETWEEN -1 AND 4),
    playlist_id TEXT,
    duration SMALLINT,
    overtime BOOLEAN,
    overtime_seconds SMALLINT,
    season SMALLINT,
    match_date TIMESTAMP WITH TIME ZONE NOT NULL,
    date_has_timezone BOOLEAN,
    visibility TEXT CHECK (visibility IN ('public', 'unlisted', 'private'))
);

CREATE TABLE IF NOT EXISTS teams (
    replay_id UUID REFERENCES replays(replay_id) ON DELETE CASCADE,
    team_color TEXT NOT NULL CHECK (team_color IN ('blue', 'orange')),
    team_name TEXT,
    PRIMARY KEY (replay_id, team_color)
);

CREATE TABLE IF NOT EXISTS team_ball_stats (
    replay_id UUID NOT NULL,
    team_color TEXT NOT NULL CHECK (team_color IN ('blue', 'orange')),
    PRIMARY KEY (replay_id, team_color),
    FOREIGN KEY (replay_id, team_color) REFERENCES teams(replay_id, team_color) ON DELETE CASCADE,
    possession_time REAL,
    time_in_side REAL
);

CREATE TABLE IF NOT EXISTS team_core_stats (
    replay_id UUID NOT NULL,
    team_color TEXT NOT NULL CHECK (team_color IN ('blue', 'orange')),
    PRIMARY KEY (replay_id, team_color),
    FOREIGN KEY (replay_id, team_color) REFERENCES teams(replay_id, team_color) ON DELETE CASCADE,
    shots SMALLINT,
    shots_against SMALLINT,
    goals SMALLINT,
    goals_against SMALLINT,
    saves SMALLINT,
    assists SMALLINT,
    score INT,
    shooting_percentage SMALLINT CHECK (shooting_percentage BETWEEN 0 AND 100)
);

CREATE TABLE IF NOT EXISTS team_boost_stats (
    replay_id UUID NOT NULL,
    team_color TEXT NOT NULL CHECK (team_color IN ('blue', 'orange')),
    PRIMARY KEY (replay_id, team_color),
    FOREIGN KEY (replay_id, team_color) REFERENCES teams(replay_id, team_color) ON DELETE CASCADE,
    bpm SMALLINT,
    bcpm REAL,
    avg_amount REAL,
    amount_collected INT,
    amount_stolen INT,
    amount_collected_big INT,
    amount_stolen_big INT,
    amount_collected_small INT,
    amount_stolen_small INT,
    count_collected_big SMALLINT,
    count_stolen_big SMALLINT,
    count_collected_small SMALLINT,
    count_stolen_small SMALLINT,
    amount_overfill INT,
    amount_overfill_stolen INT,
    amount_used_while_supersonic INT,
    time_zero_boost REAL,
    time_full_boost REAL,
    time_boost_0_25 REAL,
    time_boost_25_50 REAL,
    time_boost_50_75 REAL,
    time_boost_75_100 REAL
);

CREATE TABLE IF NOT EXISTS team_movement_stats (
    replay_id UUID NOT NULL,
    team_color TEXT NOT NULL CHECK (team_color IN ('blue', 'orange')),
    PRIMARY KEY (replay_id, team_color),
    FOREIGN KEY (replay_id, team_color) REFERENCES teams(replay_id, team_color) ON DELETE CASCADE,
    total_distance INT,
    time_supersonic_speed REAL,
    time_boost_speed REAL,
    time_slow_speed REAL,
    time_ground REAL,
    time_low_air REAL,
    time_high_air REAL,
    time_powerslide REAL,
    count_powerslide SMALLINT
);

CREATE TABLE IF NOT EXISTS team_positioning_stats (
    replay_id UUID NOT NULL,
    team_color TEXT NOT NULL CHECK (team_color IN ('blue', 'orange')),
    PRIMARY KEY (replay_id, team_color),
    FOREIGN KEY (replay_id, team_color) REFERENCES teams(replay_id, team_color) ON DELETE CASCADE,
    time_defensive_third REAL,
    time_neutral_third REAL,
    time_offensive_third REAL,
    time_defensive_half REAL,
    time_offensive_half REAL,
    time_behind_ball REAL,
    time_infront_ball REAL
);

CREATE TABLE IF NOT EXISTS team_demo_stats (
    replay_id UUID NOT NULL,
    team_color TEXT NOT NULL CHECK (team_color IN ('blue', 'orange')),
    PRIMARY KEY (replay_id, team_color),
    FOREIGN KEY (replay_id, team_color) REFERENCES teams(replay_id, team_color) ON DELETE CASCADE,
    inflicted SMALLINT,
    taken SMALLINT
);

CREATE TABLE IF NOT EXISTS players (
    player_id UUID PRIMARY KEY,
    display_name TEXT NOT NULL,
    steam_id VARCHAR(17) REFERENCES uploaders(steam_id),
    platform TEXT
);

CREATE TABLE IF NOT EXISTS replay_players (
    player_id UUID REFERENCES players(player_id) ON DELETE CASCADE,
    replay_id UUID REFERENCES replays(replay_id) ON DELETE CASCADE,
    team_color TEXT NOT NULL CHECK (team_color IN ('blue', 'orange')),
    PRIMARY KEY (player_id, replay_id),
    rank_id TEXT,
    rank_tier SMALLINT,
    rank_division SMALLINT,
    mvp BOOLEAN DEFAULT false,
    car_id SMALLINT,
    car_name TEXT,
    start_time REAL,
    end_time REAL,
);

CREATE TABLE IF NOT EXISTS player_settings (
    player_id UUID NOT NULL,
    replay_id UUID NOT NULL,
    PRIMARY KEY (player_id, replay_id),
    FOREIGN KEY (player_id, replay_id) REFERENCES replay_players(player_id, replay_id) ON DELETE CASCADE,
    fov SMALLINT,
    height SMALLINT,
    pitch SMALLINT,
    distance SMALLINT,
    stiffness REAL,
    swivel_speed REAL,
    transition_speed REAL,
    steering_sensitivity REAL
);

CREATE TABLE IF NOT EXISTS player_core_stats (
    player_id UUID NOT NULL,
    replay_id UUID NOT NULL,
    PRIMARY KEY (player_id, replay_id),
    FOREIGN KEY (player_id, replay_id) REFERENCES replay_players(player_id, replay_id) ON DELETE CASCADE,
    shots SMALLINT,
    shots_against SMALLINT,
    goals SMALLINT,
    goals_against SMALLINT,
    saves SMALLINT,
    assists SMALLINT,
    score INT,
    shooting_percentage SMALLINT CHECK (shooting_percentage BETWEEN 0 AND 100)
);

CREATE TABLE IF NOT EXISTS player_boost_stats (
    player_id UUID NOT NULL,
    replay_id UUID NOT NULL,
    PRIMARY KEY (player_id, replay_id),
    FOREIGN KEY (player_id, replay_id) REFERENCES replay_players(player_id, replay_id) ON DELETE CASCADE,
    bpm SMALLINT,
    bcpm REAL,
    avg_amount REAL,
    amount_collected INT,
    amount_stolen INT,
    amount_collected_big INT,
    amount_stolen_big INT,
    amount_collected_small INT,
    amount_stolen_small INT,
    count_collected_big SMALLINT,
    count_stolen_big SMALLINT,
    count_collected_small SMALLINT,
    count_stolen_small SMALLINT,
    amount_overfill INT,
    amount_overfill_stolen INT,
    amount_used_while_supersonic INT,
    time_zero_boost REAL,
    percent_zero_boost REAL CHECK (percent_zero_boost BETWEEN 0 AND 100),
    time_full_boost REAL,
    percent_full_boost REAL CHECK (percent_full_boost BETWEEN 0 AND 100),
    time_boost_0_25 REAL,
    time_boost_25_50 REAL,
    time_boost_50_75 REAL,
    time_boost_75_100 REAL,
    percent_boost_0_25 REAL CHECK (percent_boost_0_25 BETWEEN 0 AND 100),
    percent_boost_25_50 REAL CHECK (percent_boost_25_50 BETWEEN 0 AND 100),
    percent_boost_50_75 REAL CHECK (percent_boost_50_75 BETWEEN 0 AND 100),
    percent_boost_75_100 REAL CHECK (percent_boost_75_100 BETWEEN 0 AND 100)
);

CREATE TABLE IF NOT EXISTS player_movement_stats (
    player_id UUID NOT NULL,
    replay_id UUID NOT NULL,
    PRIMARY KEY (player_id, replay_id),
    FOREIGN KEY (player_id, replay_id) REFERENCES replay_players(player_id, replay_id) ON DELETE CASCADE,
    avg_speed INT,
    total_distance INT,
    time_supersonic_speed REAL,
    time_boost_speed REAL,
    time_slow_speed REAL,
    time_ground REAL,
    time_low_air REAL,
    time_high_air REAL,
    time_powerslide REAL,
    count_powerslide INT,
    avg_powerslide_duration REAL,
    avg_speed_percentage REAL CHECK (avg_speed_percentage BETWEEN 0 AND 100),
    percent_slow_speed REAL CHECK (percent_slow_speed BETWEEN 0 AND 100),
    percent_boost_speed REAL CHECK (percent_boost_speed BETWEEN 0 AND 100),
    percent_supersonic_speed REAL CHECK (percent_supersonic_speed BETWEEN 0 AND 100),
    percent_ground REAL CHECK (percent_ground BETWEEN 0 AND 100),
    percent_low_air REAL CHECK (percent_low_air BETWEEN 0 AND 100),
    percent_high_air REAL CHECK (percent_high_air BETWEEN 0 AND 100)
);

CREATE TABLE IF NOT EXISTS player_positioning_stats (
    player_id UUID NOT NULL,
    replay_id UUID NOT NULL,
    PRIMARY KEY (player_id, replay_id),
    FOREIGN KEY (player_id, replay_id) REFERENCES replay_players(player_id, replay_id) ON DELETE CASCADE,
    avg_distance_to_ball INT,
    avg_distance_to_ball_possession INT,
    avg_distance_to_ball_no_possession INT,
    avg_distance_to_mates INT,
    time_defensive_third REAL,
    time_neutral_third REAL,
    time_offensive_third REAL,
    time_defensive_half REAL,
    time_offensive_half REAL,
    time_behind_ball REAL,
    time_infront_ball REAL,
    time_most_back REAL,
    time_most_forward REAL,
    goals_against_while_last_defender SMALLINT,
    time_closest_to_ball REAL,
    time_farthest_from_ball REAL,
    percent_defensive_third REAL CHECK (percent_defensive_third BETWEEN 0 AND 100),
    percent_neutral_third REAL CHECK (percent_neutral_third BETWEEN 0 AND 100),
    percent_offensive_third REAL CHECK (percent_offensive_third BETWEEN 0 AND 100),
    percent_defensive_half REAL CHECK (percent_defensive_half BETWEEN 0 AND 100),
    percent_offensive_half REAL CHECK (percent_offensive_half BETWEEN 0 AND 100),
    percent_behind_ball REAL CHECK (percent_behind_ball BETWEEN 0 AND 100),
    percent_infront_ball REAL CHECK (percent_infront_ball BETWEEN 0 AND 100),
    percent_most_back REAL CHECK (percent_most_back BETWEEN 0 AND 100),
    percent_most_forward REAL CHECK (percent_most_forward BETWEEN 0 AND 100),
    percent_closest_to_ball REAL CHECK (percent_closest_to_ball BETWEEN 0 AND 100),
    percent_farthest_from_ball REAL CHECK (percent_farthest_from_ball BETWEEN 0 AND 100)
);

CREATE TABLE IF NOT EXISTS player_demo_stats (
    player_id UUID NOT NULL,
    replay_id UUID NOT NULL,
    PRIMARY KEY (player_id, replay_id),
    FOREIGN KEY (player_id, replay_id) REFERENCES replay_players(player_id, replay_id) ON DELETE CASCADE,
    inflicted SMALLINT,
    taken SMALLINT
);