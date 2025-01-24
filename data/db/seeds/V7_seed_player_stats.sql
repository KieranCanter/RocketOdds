-- Seed data for replay: 9d37f8dd-3598-49b7-967c-9a013ecf5f74

-- Player settings for id: 63cd259f7edb442188c3059a2da869f4 on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '63cd259f7edb442188c3059a2da869f4' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    110,
    100,
    -3,
    270,
    0.35,
    4.7,
    1.5,
    1.5
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '63cd259f7edb442188c3059a2da869f4' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    7,
    8,
    3,
    4,
    4,
    0,
    835,
    42.857143
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '63cd259f7edb442188c3059a2da869f4' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    419,
    402.80545,
    45.86,
    2326,
    572,
    1590,
    325,
    736,
    247,
    20,
    4,
    68,
    23,
    303,
    52,
    228,
    29.25,
    8.442289,
    40.18,
    11.596964,
    106.88,
    101.19,
    76.24,
    66.42,
    30.473585,
    28.851255,
    21.73752,
    18.937645
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '63cd259f7edb442188c3059a2da869f4' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    1494,
    503844,
    63.93,
    127.92,
    174.9,
    198.79,
    158.46,
    9.5,
    16.9,
    164,
    0.1,
    64.95652,
    47.689163,
    34.879345,
    17.431494,
    54.203136,
    43.206547,
    2.5903203
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '63cd259f7edb442188c3059a2da869f4' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    1747,
    1571,
    1852,
    -1,
    183.08,
    111.43,
    72.25,
    235.42,
    131.33,
    286.98,
    79.77,
    340.5,
    340.5,
    4,
    340.5,
    340.5,
    49.9182,
    30.382265,
    19.69953,
    64.190865,
    35.809135,
    78.2495,
    21.75051,
    98.27691,
    98.27691,
    98.27691,
    98.27691
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '63cd259f7edb442188c3059a2da869f4' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    0,
    1
);

-- End of player settings for id: 63cd259f7edb442188c3059a2da869f4 on epic

-- Player settings for id: 6ee67185658f4f819a72564d44ac5010 on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '6ee67185658f4f819a72564d44ac5010' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    110,
    110,
    -5,
    270,
    0.6,
    3,
    1,
    1.5
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '6ee67185658f4f819a72564d44ac5010' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    8,
    7,
    4,
    3,
    3,
    0,
    972,
    50
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '6ee67185658f4f819a72564d44ac5010' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    493,
    511.9058,
    46.13,
    2956,
    862,
    2442,
    684,
    514,
    178,
    30,
    9,
    45,
    16,
    566,
    224,
    405,
    22.92,
    6.615291,
    48.09,
    13.87999,
    134.8,
    74.1,
    58.22,
    90.21,
    37.724236,
    20.737135,
    16.293062,
    25.245573
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '6ee67185658f4f819a72564d44ac5010' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    1453,
    494864,
    47.99,
    140.32,
    181.36,
    195.2,
    165.55,
    8.91,
    6.39,
    66,
    0.1,
    63.173912,
    49.059975,
    37.958183,
    12.98185,
    52.80528,
    44.784397,
    2.410323
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '6ee67185658f4f819a72564d44ac5010' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    1294,
    975,
    1653,
    -1,
    147.53,
    99.9,
    122.23,
    202.95,
    166.71,
    254.86,
    114.81,
    340.6,
    340.6,
    3,
    340.6,
    340.6,
    39.909645,
    27.024834,
    33.06552,
    54.901802,
    45.098198,
    68.94257,
    31.05743,
    98.30577,
    98.30577,
    98.30577,
    98.30577
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '6ee67185658f4f819a72564d44ac5010' 
        AND platform = 'epic'
    )',
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    1,
    0
);

-- End of player settings for id: 6ee67185658f4f819a72564d44ac5010 on epic

-- End seed data for replay: 9d37f8dd-3598-49b7-967c-9a013ecf5f74



-- Seed data for replay: 32341018-395a-446d-a3a7-cc213598cf7f

-- Player settings for id: c23ef2acb4214ca5b76de99337ec1dd0 on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'c23ef2acb4214ca5b76de99337ec1dd0' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    110,
    110,
    -6,
    300,
    0.7,
    5,
    1.2,
    2
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'c23ef2acb4214ca5b76de99337ec1dd0' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    5,
    7,
    4,
    3,
    0,
    1,
    721,
    80
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'c23ef2acb4214ca5b76de99337ec1dd0' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    244,
    260.7728,
    48.15,
    1406,
    203,
    650,
    0,
    756,
    203,
    9,
    0,
    66,
    17,
    276,
    0,
    436,
    34.93,
    10.797527,
    25.76,
    7.962906,
    92.75,
    87.02,
    58.2,
    77.34,
    29.415497,
    27.598236,
    18.458025,
    24.52824
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'c23ef2acb4214ca5b76de99337ec1dd0' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    1303,
    408744,
    11.55,
    104.34,
    232.98,
    257.76,
    85.6,
    5.5,
    3.18,
    23,
    0.14,
    56.652172,
    66.78133,
    29.90799,
    3.3106887,
    73.88637,
    24.537062,
    1.5765636
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'c23ef2acb4214ca5b76de99337ec1dd0' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    2590,
    2511,
    2570,
    2932,
    201.88,
    94.07,
    52.92,
    253.77,
    95.09,
    256.05,
    92.82,
    162.9,
    154.3,
    1,
    146.8,
    170.6,
    57.86683,
    26.9642,
    15.168974,
    72.74265,
    27.257353,
    73.3941,
    26.6059,
    50.355484,
    47.697063,
    45.37867,
    52.735703
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'c23ef2acb4214ca5b76de99337ec1dd0' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    3,
    0
);

-- End of player settings for id: c23ef2acb4214ca5b76de99337ec1dd0 on epic

-- Player settings for id: eeac7105aca64272b5964be1fc6e1d54 on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'eeac7105aca64272b5964be1fc6e1d54' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    105,
    100,
    -3,
    280,
    0.5,
    2.5,
    1,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'eeac7105aca64272b5964be1fc6e1d54' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    2,
    7,
    2,
    3,
    0,
    2,
    400,
    100
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'eeac7105aca64272b5964be1fc6e1d54' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    289,
    326.05875,
    45.98,
    1758,
    320,
    1258,
    200,
    500,
    120,
    15,
    2,
    45,
    10,
    250,
    0,
    155,
    38.42,
    11.876351,
    23.21,
    7.174652,
    127.26,
    66.01,
    30.03,
    99.87,
    39.378654,
    20.425781,
    9.292322,
    30.903238
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'eeac7105aca64272b5964be1fc6e1d54' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    1222,
    383921,
    14.93,
    102.99,
    231.79,
    233.12,
    106.87,
    9.72,
    5.48,
    24,
    0.23,
    53.130436,
    66.28063,
    29.450117,
    4.269252,
    66.66095,
    30.559607,
    2.779446
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'eeac7105aca64272b5964be1fc6e1d54' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    2341,
    2530,
    2201,
    2932,
    187.66,
    99.52,
    62.52,
    232.76,
    116.94,
    249.32,
    100.38,
    161.6,
    161,
    2,
    169,
    153.4,
    53.66314,
    28.458677,
    17.878181,
    66.559906,
    33.44009,
    71.295395,
    28.704603,
    49.953636,
    49.76816,
    52.24111,
    47.418854
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'eeac7105aca64272b5964be1fc6e1d54' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    0,
    0
);

-- End of player settings for id: eeac7105aca64272b5964be1fc6e1d54 on epic

-- Player settings for id: 90b737843ba343c2b02a3a530ffdf825 on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    110,
    110,
    -4,
    270,
    1,
    5.3,
    1,
    1.1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    5,
    7,
    2,
    6,
    1,
    1,
    511,
    40
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    419,
    479.07263,
    48.9,
    2583,
    834,
    2042,
    619,
    541,
    215,
    23,
    7,
    49,
    20,
    247,
    70,
    163,
    41.89,
    12.948996,
    24.57,
    7.595054,
    97.08,
    60.24,
    58.43,
    105.35,
    30.233572,
    18.76051,
    18.196823,
    32.809093
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    1403,
    425795,
    21.85,
    136.5,
    181.32,
    229.53,
    101.48,
    8.65,
    7.1,
    58,
    0.12,
    61,
    53.38122,
    40.18606,
    6.432714,
    67.5764,
    29.876936,
    2.546664
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    2297,
    1996,
    2676,
    2946,
    146.42,
    76.89,
    116.35,
    178.62,
    161.04,
    247.05,
    92.62,
    159.5,
    165.2,
    2,
    176.1,
    148.4,
    43.10782,
    22.637344,
    34.254845,
    52.587887,
    47.412117,
    72.73235,
    27.267641,
    49.30448,
    51.06646,
    54.43586,
    45.873257
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    0,
    2
);

-- End of player settings for id: 90b737843ba343c2b02a3a530ffdf825 on epic

-- Player settings for id: 995a75abf4184485ad59186cd79a3497 on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    110,
    110,
    -4,
    330,
    1,
    5.4,
    1,
    1.1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    2,
    7,
    1,
    6,
    0,
    1,
    292,
    50
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    347,
    339.9691,
    42.61,
    1833,
    318,
    1174,
    100,
    659,
    218,
    15,
    1,
    60,
    20,
    343,
    2,
    255,
    43.32,
    13.391035,
    37.76,
    11.672333,
    134.97,
    67.51,
    46.77,
    72.23,
    41.983948,
    20.99975,
    14.548339,
    22.467962
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    1399,
    434164,
    26.95,
    125.76,
    192.86,
    237.97,
    99.71,
    7.89,
    3.27,
    11,
    0.3,
    60.826088,
    55.809242,
    36.392048,
    7.7987094,
    68.86304,
    28.853777,
    2.2831843
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    2501,
    2490,
    2548,
    2946,
    152.06,
    111.57,
    81.93,
    208.81,
    136.76,
    252.11,
    93.45,
    174,
    151.3,
    4,
    140,
    185.5,
    44.003937,
    32.286724,
    23.709341,
    60.424805,
    39.57519,
    72.95694,
    27.04306,
    53.78671,
    46.769707,
    43.27666,
    57.341576
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '32341018-395a-446d-a3a7-cc213598cf7f',
    0,
    1
);

-- End of player settings for id: 995a75abf4184485ad59186cd79a3497 on epic

-- End seed data for replay: 32341018-395a-446d-a3a7-cc213598cf7f



-- Seed data for replay: 2852f730-8d9d-4658-b7cd-77bff44cde15

-- Player settings for id: 21e5bc487bd841c99066de9d40674541 on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '21e5bc487bd841c99066de9d40674541' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    90,
    100,
    -3,
    260,
    0.3,
    2.5,
    1,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '21e5bc487bd841c99066de9d40674541' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    4,
    3,
    4,
    1,
    0,
    1,
    699,
    100
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '21e5bc487bd841c99066de9d40674541' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    195,
    240.31223,
    49.21,
    1447,
    409,
    1093,
    206,
    354,
    203,
    14,
    3,
    32,
    18,
    300,
    105,
    272,
    61.07,
    16.903786,
    53.82,
    14.897033,
    103.21,
    39.73,
    56.04,
    132.79,
    31.108898,
    11.9751625,
    16.891218,
    40.02471
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '21e5bc487bd841c99066de9d40674541' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    1301,
    452729,
    13.63,
    110.18,
    263.54,
    280.84,
    99.15,
    7.36,
    0,
    0,
    0,
    56.565216,
    68.03666,
    28.44456,
    3.5187814,
    72.50291,
    25.597008,
    1.9000905
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '21e5bc487bd841c99066de9d40674541' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    2664,
    2553,
    3124,
    3218,
    161.29,
    111.08,
    114.99,
    211.74,
    175.61,
    306.28,
    81.07,
    126.5,
    123.2,
    1,
    142.7,
    117,
    41.638268,
    28.676168,
    29.685564,
    54.66374,
    45.336258,
    79.07061,
    20.929392,
    35.014393,
    34.100975,
    39.49845,
    32.384853
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '21e5bc487bd841c99066de9d40674541' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    1,
    1
);

-- End of player settings for id: 21e5bc487bd841c99066de9d40674541 on epic

-- Player settings for id: d995e51af0010900 on xbox

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'd995e51af0010900' 
        AND platform = 'xbox'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    110,
    80,
    -4,
    250,
    0.15,
    7,
    1.3,
    1.7
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'd995e51af0010900' 
        AND platform = 'xbox'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    3,
    3,
    2,
    1,
    1,
    2,
    462,
    66.666664
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'd995e51af0010900' 
        AND platform = 'xbox'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    286,
    269.54163,
    45.44,
    1623,
    294,
    1314,
    127,
    309,
    167,
    14,
    2,
    27,
    15,
    92,
    75,
    114,
    65.81,
    18.215788,
    30.26,
    8.375775,
    99.79,
    88.69,
    17.6,
    111.33,
    31.43883,
    27.941776,
    5.5448785,
    35.074505
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'd995e51af0010900' 
        AND platform = 'xbox'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    1439,
    393228,
    26.62,
    132.53,
    197.53,
    176.61,
    173.71,
    6.36,
    0.45,
    1,
    0.45,
    62.565216,
    55.380173,
    37.156555,
    7.4632726,
    49.514973,
    48.70192,
    1.783111
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'd995e51af0010900' 
        AND platform = 'xbox'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    3480,
    3481,
    3668,
    3476,
    187.93,
    74.66,
    94.08,
    227.87,
    128.8,
    268.86,
    87.81,
    144.6,
    96,
    -1,
    79.6,
    149.9,
    52.69016,
    20.932516,
    26.377323,
    63.88819,
    36.111813,
    75.3806,
    24.619398,
    40.02436,
    26.572187,
    22.032772,
    41.49136
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'd995e51af0010900' 
        AND platform = 'xbox'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    0,
    0
);

-- End of player settings for id: d995e51af0010900 on xbox

-- Player settings for id: ea31badbb9344cb2829ba70d930534b0 on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ea31badbb9344cb2829ba70d930534b0' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    110,
    90,
    -5,
    270,
    0.35,
    4.7,
    1.2,
    1.75
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ea31badbb9344cb2829ba70d930534b0' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    4,
    3,
    2,
    1,
    0,
    1,
    432,
    50
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ea31badbb9344cb2829ba70d930534b0' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    353,
    346.10275,
    56.3,
    2084,
    321,
    1552,
    178,
    532,
    143,
    20,
    3,
    50,
    15,
    322,
    127,
    201,
    33.4,
    9.244907,
    53.88,
    14.91364,
    96.93,
    80.7,
    74.56,
    117.78,
    26.19942,
    21.812578,
    20.152985,
    31.835014
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ea31badbb9344cb2829ba70d930534b0' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    1435,
    505373,
    36.88,
    141.52,
    211.94,
    213.43,
    166.93,
    9.98,
    3.06,
    15,
    0.2,
    62.391304,
    54.29625,
    36.25557,
    9.448173,
    54.677975,
    42.76528,
    2.5567453
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ea31badbb9344cb2829ba70d930534b0' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    2647,
    2575,
    3002,
    3486,
    165.26,
    121.02,
    104.06,
    225.02,
    165.32,
    276.21,
    114.13,
    123.4,
    144.3,
    -1,
    147.7,
    118.5,
    42.33745,
    31.00374,
    26.65881,
    57.647175,
    42.352818,
    70.76139,
    29.238613,
    34.156334,
    39.94132,
    40.88242,
    32.800045
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ea31badbb9344cb2829ba70d930534b0' 
        AND platform = 'epic'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    1,
    0
);

-- End of player settings for id: ea31badbb9344cb2829ba70d930534b0 on epic

-- Player settings for id: RenzokukenX88 on ps4

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'RenzokukenX88' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    90,
    100,
    -3,
    260,
    0.5,
    2.5,
    1,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'RenzokukenX88' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    2,
    11,
    1,
    8,
    0,
    0,
    154,
    50
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'RenzokukenX88' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    153,
    181.7183,
    48.3,
    827,
    256,
    280,
    0,
    547,
    256,
    4,
    0,
    47,
    22,
    128,
    8,
    0,
    16.58,
    6.0719256,
    13.77,
    5.0428476,
    69.41,
    61.46,
    78.64,
    43.31,
    27.454319,
    24.309786,
    31.105135,
    17.130766
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'RenzokukenX88' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    1266,
    311030,
    5.88,
    73.08,
    208.45,
    193.62,
    87.46,
    6.34,
    4.46,
    24,
    0.19,
    55.04348,
    72.527054,
    25.42709,
    2.045858,
    67.36484,
    30.429338,
    2.2058313
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'RenzokukenX88' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    2953,
    2890,
    2992,
    3066,
    159.24,
    66.42,
    61.76,
    195.33,
    92.08,
    196.9,
    90.51,
    87.4,
    100.4,
    2,
    70.6,
    107.7,
    55.403248,
    23.109041,
    21.48772,
    67.96214,
    32.037853,
    68.5084,
    31.491596,
    32.007618,
    36.768475,
    25.855124,
    39.441883
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'RenzokukenX88' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    0,
    0
);

-- End of player settings for id: RenzokukenX88 on ps4

-- Player settings for id: E100_C on ps4

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'E100_C' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    110,
    90,
    -4,
    280,
    0.4,
    4,
    1.5,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'E100_C' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    0,
    11,
    0,
    8,
    1,
    0,
    129,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'E100_C' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    213,
    220.55725,
    37.18,
    1099,
    208,
    716,
    100,
    383,
    108,
    8,
    1,
    32,
    9,
    83,
    0,
    61,
    40.77,
    13.63682,
    22.77,
    7.616149,
    60.52,
    124.12,
    35.92,
    46.39,
    22.670912,
    46.495598,
    13.455702,
    17.377785
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'E100_C' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    1255,
    354685,
    14.24,
    81.52,
    219.98,
    182.07,
    126.77,
    6.9,
    0.87,
    2,
    0.44,
    54.565216,
    69.67125,
    25.81871,
    4.5100403,
    57.664536,
    40.150124,
    2.1853426
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'E100_C' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    2827,
    2716,
    2877,
    3085,
    192.52,
    72.98,
    50.24,
    233.36,
    82.38,
    210.26,
    105.48,
    109.7,
    106.9,
    1,
    111.7,
    129.8,
    60.974216,
    23.113955,
    15.911825,
    73.90891,
    26.09109,
    66.592766,
    33.407234,
    36.692646,
    35.756096,
    37.361607,
    43.415726
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'E100_C' 
        AND platform = 'ps4'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    0,
    1
);

-- End of player settings for id: E100_C on ps4

-- Player settings for id: ac7992de05de78b0 on psynet

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ac7992de05de78b0' 
        AND platform = 'psynet'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    90,
    100,
    -3,
    260,
    0.3,
    2.5,
    1,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ac7992de05de78b0' 
        AND platform = 'psynet'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    1,
    11,
    0,
    8,
    0,
    1,
    118,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ac7992de05de78b0' 
        AND platform = 'psynet'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    253,
    184.51064,
    34.89,
    1111,
    331,
    774,
    187,
    337,
    144,
    9,
    2,
    28,
    12,
    125,
    12,
    311,
    63.4,
    17.548716,
    28.55,
    7.902458,
    143.46,
    52.43,
    27.92,
    46.15,
    53.141205,
    19.421394,
    10.342272,
    17.095123
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ac7992de05de78b0' 
        AND platform = 'psynet'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    1161,
    376459,
    15.85,
    102.99,
    266.17,
    295.04,
    86.02,
    3.94,
    7.39,
    11,
    0.67,
    50.47826,
    69.13327,
    26.749954,
    4.116776,
    76.633766,
    22.342857,
    1.0233766
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ac7992de05de78b0' 
        AND platform = 'psynet'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    2583,
    2711,
    2575,
    3316,
    240.83,
    83,
    61.18,
    288.49,
    96.52,
    277.56,
    107.45,
    197,
    164.8,
    6,
    178.6,
    175.2,
    62.55162,
    21.55788,
    15.890496,
    74.93053,
    25.06948,
    72.09163,
    27.908365,
    54.528343,
    45.61559,
    49.43534,
    48.494244
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ac7992de05de78b0' 
        AND platform = 'psynet'
    )',
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    1,
    1
);

-- End of player settings for id: ac7992de05de78b0 on psynet

-- End seed data for replay: 2852f730-8d9d-4658-b7cd-77bff44cde15



-- Seed data for replay: fc54e2d6-1c9e-4479-9169-e4d02b185c13

-- Player settings for id: Deadline642 on ps4

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Deadline642' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    90,
    100,
    -3,
    260,
    0.3,
    2.5,
    1,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Deadline642' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1,
    6,
    0,
    2,
    2,
    1,
    301,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Deadline642' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    157,
    180.79095,
    64.5,
    976,
    157,
    318,
    42,
    658,
    115,
    5,
    1,
    59,
    10,
    218,
    60,
    19,
    5.97,
    1.8431046,
    75.56,
    23.327467,
    19.51,
    73.45,
    85.95,
    138.62,
    6.1443014,
    23.131672,
    27.068308,
    43.655716
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Deadline642' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1187,
    376032,
    6.99,
    97.1,
    231.54,
    228.9,
    105.84,
    0.9,
    9.33,
    14,
    0.67,
    51.608696,
    68.98669,
    28.93067,
    2.0826507,
    68.198074,
    31.533787,
    0.26814446
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Deadline642' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    2970,
    3124,
    2795,
    3209,
    181.3,
    105.85,
    48.49,
    237,
    98.63,
    241.5,
    94.14,
    95.5,
    60.7,
    1,
    68.1,
    92.2,
    54.016205,
    31.536764,
    14.447026,
    70.61347,
    29.386526,
    71.95209,
    28.047907,
    29.483498,
    18.739773,
    21.024359,
    28.464697
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Deadline642' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1,
    0
);

-- End of player settings for id: Deadline642 on ps4

-- Player settings for id: 76561198311926297 on steam

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198311926297' 
        AND platform = 'steam'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    110,
    100,
    -4,
    300,
    0.4,
    6.2,
    1,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198311926297' 
        AND platform = 'steam'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    3,
    6,
    1,
    2,
    0,
    0,
    212,
    33.333332
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198311926297' 
        AND platform = 'steam'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    232,
    222.46921,
    50.35,
    1201,
    287,
    685,
    113,
    516,
    174,
    10,
    2,
    45,
    15,
    339,
    93,
    95,
    28.53,
    8.808002,
    44.83,
    13.840264,
    83.94,
    67.01,
    68.28,
    97.52,
    26.500395,
    21.155485,
    21.556433,
    30.787687
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198311926297' 
        AND platform = 'steam'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1231,
    392573,
    14.81,
    92.33,
    227.56,
    214.17,
    112.29,
    8.24,
    10.46,
    61,
    0.17,
    53.52174,
    67.98924,
    27.585897,
    4.424858,
    63.98865,
    33.54945,
    2.4619064
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198311926297' 
        AND platform = 'steam'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    2589,
    2610,
    2575,
    3155,
    182.53,
    87.34,
    64.82,
    236.47,
    98.23,
    237.79,
    96.91,
    101.7,
    75.8,
    -1,
    80.7,
    69.3,
    54.537033,
    26.09579,
    19.367176,
    70.65133,
    29.34867,
    71.04571,
    28.954287,
    31.39761,
    23.401564,
    24.914326,
    21.394833
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198311926297' 
        AND platform = 'steam'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1,
    0
);

-- End of player settings for id: 76561198311926297 on steam

-- Player settings for id: Lolo1313s on ps4

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Lolo1313s' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    110,
    100,
    -3,
    270,
    0.35,
    4,
    1,
    1.5
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Lolo1313s' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    6,
    0,
    2,
    1,
    0,
    128,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Lolo1313s' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    389,
    391.56604,
    48.53,
    1789,
    263,
    1426,
    167,
    363,
    96,
    17,
    3,
    30,
    9,
    273,
    132,
    252,
    48.01,
    17.513588,
    23.78,
    8.674716,
    86.46,
    68.39,
    53.99,
    69.91,
    31.01704,
    24.534529,
    19.36861,
    25.079823
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Lolo1313s' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1341,
    363843,
    22.5,
    110.69,
    149.63,
    185.11,
    90.74,
    6.97,
    4.47,
    28,
    0.16,
    58.304348,
    52.90644,
    39.137966,
    7.95559,
    65.45152,
    32.08401,
    2.464465
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Lolo1313s' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    3021,
    2982,
    3068,
    2578,
    147.08,
    81.42,
    54.32,
    191.14,
    91.67,
    179.79,
    103.03,
    72.7,
    75.6,
    1,
    65.5,
    78.1,
    52.004807,
    28.788628,
    19.206562,
    67.58601,
    32.41399,
    63.57047,
    36.42953,
    26.520262,
    27.578156,
    23.893772,
    28.490131
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Lolo1313s' 
        AND platform = 'ps4'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    0
);

-- End of player settings for id: Lolo1313s on ps4

-- Player settings for id: 837048efe5e14624821daa30d2beaccc on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '837048efe5e14624821daa30d2beaccc' 
        AND platform = 'epic'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    110,
    110,
    -6,
    310,
    0.5,
    5.5,
    2,
    1.55
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '837048efe5e14624821daa30d2beaccc' 
        AND platform = 'epic'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    2,
    6,
    0,
    2,
    0,
    0,
    104,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '837048efe5e14624821daa30d2beaccc' 
        AND platform = 'epic'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    378,
    390.8493,
    47.61,
    2110,
    468,
    1673,
    323,
    437,
    145,
    20,
    4,
    39,
    12,
    249,
    58,
    345,
    60.25,
    18.600845,
    30.77,
    9.499552,
    129.87,
    67.26,
    43.35,
    85.84,
    39.798355,
    20.61167,
    13.284506,
    26.305466
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '837048efe5e14624821daa30d2beaccc' 
        AND platform = 'epic'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1526,
    478261,
    58.1,
    112.79,
    164.71,
    174.79,
    140.73,
    20.09,
    4.23,
    26,
    0.16,
    66.347824,
    49.07926,
    33.608463,
    17.312277,
    52.081287,
    41.932602,
    5.986115
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '837048efe5e14624821daa30d2beaccc' 
        AND platform = 'epic'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    2651,
    2299,
    3046,
    3675,
    169.31,
    92.37,
    73.93,
    223.94,
    111.66,
    222.28,
    113.32,
    62.5,
    98.6,
    -1,
    97.5,
    78.5,
    50.44844,
    27.52302,
    22.028545,
    66.72825,
    33.27175,
    66.23361,
    33.766388,
    19.295483,
    30.440554,
    30.100954,
    24.235126
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '837048efe5e14624821daa30d2beaccc' 
        AND platform = 'epic'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1,
    0
);

-- End of player settings for id: 837048efe5e14624821daa30d2beaccc on epic

-- Player settings for an unnamed user

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    90,
    100,
    -3,
    260,
    0.3,
    2.5,
    1,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    6,
    0,
    2,
    0,
    0,
    2,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    104,
    157.11407,
    58.99,
    143,
    23,
    36,
    0,
    107,
    23,
    2,
    0,
    9,
    2,
    163,
    0,
    3,
    4.23,
    7.745834,
    0.1,
    0.18311664,
    11.93,
    12.98,
    16,
    11.6,
    22.71948,
    24.7191,
    30.470385,
    22.09103
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1136,
    57110,
    1.17,
    7.4,
    44.09,
    50.15,
    2.5,
    0,
    0.5,
    2,
    0.25,
    49.391304,
    83.72579,
    14.052412,
    2.2218,
    95.251656,
    4.7483377,
    0
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    3133,
    3526,
    2978,
    2792,
    25.21,
    26.67,
    0.77,
    39.42,
    13.24,
    35.78,
    16.87,
    9.7,
    13,
    -1,
    12,
    13.4,
    47.88224,
    50.65527,
    1.462488,
    74.857574,
    25.142426,
    67.95821,
    32.041786,
    17.762314,
    23.805164,
    21.973997,
    24.53763
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    0
);

-- End of player settings for an unnamed user

-- Player settings for id: 15febf35f7010900 on xbox

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '15febf35f7010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    100,
    110,
    -9,
    350,
    0.6,
    6.3,
    2,
    3
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '15febf35f7010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    2,
    6,
    2,
    1,
    2,
    0,
    469,
    100
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '15febf35f7010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    256,
    277.85495,
    51.92,
    1500,
    398,
    1208,
    273,
    292,
    125,
    14,
    4,
    22,
    11,
    196,
    126,
    322,
    22.04,
    6.804359,
    120.34,
    37.152294,
    61.92,
    52.95,
    72.12,
    137.64,
    19.074022,
    16.310877,
    22.216063,
    42.399036
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '15febf35f7010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1392,
    414156,
    31.17,
    108.18,
    196.19,
    202.71,
    120.82,
    12,
    4.93,
    8,
    0.62,
    60.52174,
    58.46993,
    32.240566,
    9.289503,
    60.414867,
    36.0087,
    3.5764313
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '15febf35f7010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    3074,
    2771,
    3342,
    4134,
    194.39,
    70.25,
    70.89,
    237.5,
    98.03,
    266.57,
    68.96,
    88.4,
    92.8,
    1,
    107.6,
    64.3,
    57.935207,
    20.937025,
    21.127768,
    70.78354,
    29.216463,
    79.44744,
    20.552559,
    27.29153,
    28.649933,
    33.219105,
    19.851194
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '15febf35f7010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    0
);

-- End of player settings for id: 15febf35f7010900 on xbox

-- Player settings for id: ff6dbfe7fb010900 on xbox

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ff6dbfe7fb010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    110,
    110,
    -3,
    270,
    0.7,
    4,
    1.4,
    1.01
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ff6dbfe7fb010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1,
    6,
    0,
    1,
    2,
    0,
    243,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ff6dbfe7fb010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    98,
    140.77985,
    60.95,
    760,
    172,
    349,
    100,
    411,
    72,
    5,
    1,
    35,
    6,
    155,
    0,
    82,
    9.11,
    2.8125095,
    94.04,
    29.032755,
    16.38,
    50.23,
    70.82,
    176.05,
    5.2252135,
    16.023352,
    22.591555,
    56.159885
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ff6dbfe7fb010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    974,
    274982,
    9.76,
    58.36,
    264.02,
    194.61,
    131.56,
    5.97,
    2.57,
    12,
    0.21,
    42.347828,
    79.49057,
    17.570904,
    2.9385197,
    58.592766,
    39.609806,
    1.7974349
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ff6dbfe7fb010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    3777,
    4032,
    3594,
    4089,
    236.12,
    51.51,
    44.51,
    262.83,
    69.3,
    302.69,
    29.44,
    163.4,
    61.3,
    -1,
    71.7,
    97.2,
    71.0905,
    15.50852,
    13.400975,
    79.13467,
    20.865326,
    91.136,
    8.863999,
    50.44611,
    18.92501,
    22.135777,
    30.008335
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'ff6dbfe7fb010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    1
);

-- End of player settings for id: ff6dbfe7fb010900 on xbox

-- Player settings for id: 58620a77f8010900 on xbox

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '58620a77f8010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    110,
    110,
    -3,
    280,
    0.5,
    2.6,
    1.5,
    3.2
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '58620a77f8010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    3,
    6,
    0,
    1,
    0,
    1,
    144,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '58620a77f8010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    126,
    149.30074,
    57.42,
    806,
    169,
    341,
    0,
    465,
    169,
    5,
    0,
    41,
    14,
    173,
    0,
    118,
    23.03,
    7.1099997,
    40.21,
    12.413942,
    51.06,
    49.76,
    87.11,
    132.59,
    15.930364,
    15.524773,
    27.177711,
    41.367153
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '58620a77f8010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1313,
    410567,
    11.94,
    104.91,
    212.79,
    227.13,
    100.53,
    1.97,
    3.97,
    7,
    0.57,
    57.086956,
    64.55224,
    31.825626,
    3.622133,
    68.904526,
    30.497831,
    0.59763974
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '58620a77f8010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    2685,
    2593,
    2779,
    3860,
    151.22,
    112.81,
    65.61,
    208.56,
    121.07,
    243.61,
    86.02,
    18,
    89.3,
    -1,
    114.5,
    30.8,
    45.874287,
    34.22218,
    19.90353,
    63.27094,
    36.72906,
    73.904076,
    26.095926,
    5.5570993,
    27.569386,
    35.349323,
    9.508814
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '58620a77f8010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    2
);

-- End of player settings for id: 58620a77f8010900 on xbox

-- Player settings for an unnamed user

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    90,
    100,
    -3,
    260,
    0.3,
    2.5,
    1,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    6,
    0,
    1,
    0,
    0,
    2,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    147,
    103.55456,
    15.13,
    84,
    36,
    0,
    0,
    84,
    36,
    0,
    0,
    7,
    3,
    0,
    0,
    12,
    17.59,
    36.14136,
    0,
    0,
    42.88,
    3.74,
    0,
    0,
    91.977684,
    8.022307,
    0,
    0
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1079,
    50353,
    0.57,
    6.33,
    43.46,
    39.54,
    10.82,
    0,
    0,
    0,
    0,
    46.913044,
    86.298645,
    12.569499,
    1.1318507,
    78.514694,
    21.485306,
    0
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    2320,
    2462,
    2031,
    2896,
    18.46,
    20.46,
    11.44,
    30.09,
    20.27,
    43.93,
    6.43,
    12.2,
    5.2,
    -1,
    11.5,
    8.4,
    36.656075,
    40.627483,
    22.716444,
    59.7498,
    40.2502,
    87.231926,
    12.768069,
    25.066776,
    10.6842,
    23.62852,
    17.25909
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Sabretooth' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    0
);

-- End of player settings for an unnamed user

-- Player settings for id: 8d43d872fa010900 on xbox

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '8d43d872fa010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    110,
    110,
    -3,
    270,
    0.7,
    4.7,
    1.4,
    3.09
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '8d43d872fa010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    6,
    0,
    1,
    0,
    0,
    0,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '8d43d872fa010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    183,
    40.251213,
    45.02,
    188,
    0,
    152,
    0,
    36,
    0,
    2,
    0,
    3,
    0,
    47,
    0,
    0,
    0.3,
    0.10705111,
    0,
    0,
    9.61,
    6.21,
    1.33,
    0.97,
    53.03532,
    34.271526,
    7.3399563,
    5.3532014
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '8d43d872fa010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    1086,
    258164,
    0.33,
    56.38,
    227.31,
    53,
    131.58,
    99.43,
    1.63,
    2,
    0.82,
    47.217392,
    80.0331,
    19.850716,
    0.116189,
    18.661314,
    46.329353,
    35.00933
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '8d43d872fa010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    6270,
    6114,
    6425,
    5611,
    209.69,
    29.2,
    45.13,
    226.56,
    57.46,
    205.99,
    78.03,
    122.7,
    76,
    -1,
    21.8,
    170.8,
    73.8293,
    10.280966,
    15.889725,
    79.769035,
    20.23097,
    72.52658,
    27.473415,
    43.7839,
    27.119614,
    7.779047,
    60.94776
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '8d43d872fa010900' 
        AND platform = 'xbox'
    )',
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    0,
    0
);

-- End of player settings for id: 8d43d872fa010900 on xbox

-- End seed data for replay: fc54e2d6-1c9e-4479-9169-e4d02b185c13



-- Seed data for replay: a4676587-9373-401b-9de1-5ea48839f574

-- Player settings for id: 76561198058831591 on steam

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198058831591' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    110,
    80,
    -7,
    320,
    1,
    10,
    1.9,
    1.18
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198058831591' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    1,
    0,
    0,
    0,
    0,
    2,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198058831591' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    129,
    311.5455,
    41.41,
    85,
    0,
    85,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    14,
    0,
    0,
    0,
    0,
    0,
    0,
    2.94,
    4.57,
    0,
    1.37,
    33.10811,
    51.463966,
    0,
    15.427928
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198058831591' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    1180,
    14885,
    0,
    5.7,
    12.74,
    11.92,
    6.53,
    0,
    0.15,
    1,
    0.15,
    51.304348,
    69.08894,
    30.911066,
    0,
    64.60704,
    35.392952,
    0
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198058831591' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    3723,
    4885,
    3700,
    4178,
    13.16,
    5.28,
    0,
    18.44,
    0,
    11.97,
    6.47,
    4.8,
    8.5,
    -1,
    4.4,
    9.4,
    71.36659,
    28.633406,
    0,
    100,
    0,
    64.91323,
    35.086765,
    29.32193,
    51.924248,
    26.878435,
    57.422108
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198058831591' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    0
);

-- End of player settings for id: 76561198058831591 on steam

-- Player settings for an unnamed user

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Shepard' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    90,
    100,
    -3,
    260,
    0.3,
    2.5,
    1,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Shepard' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Shepard' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    222,
    0,
    18.82,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    9,
    0,
    0,
    0,
    100,
    0,
    0,
    0
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Shepard' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    675,
    4080,
    0,
    0,
    11.37,
    8.83,
    2.54,
    0,
    0,
    0,
    0,
    29.347826,
    100,
    0,
    0,
    77.66051,
    22.33949,
    0
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Shepard' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    4324,
    5199,
    2482,
    2308,
    11.37,
    0,
    0,
    11.37,
    0,
    11.37,
    0,
    10,
    0.4,
    -1,
    1.4,
    7.9,
    100,
    0,
    0,
    100,
    0,
    100,
    0,
    74.906364,
    2.9962547,
    10.486891,
    59.17603
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE display_name = 'Shepard' 
        AND platform_id IS NULL AND platform IS NULL
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    0
);

-- End of player settings for an unnamed user

-- Player settings for id: 76561198145737268 on steam

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198145737268' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    110,
    130,
    -4,
    300,
    0.4,
    5.5,
    1.8,
    1.2
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198145737268' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198145737268' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    370,
    307.88025,
    45.14,
    84,
    0,
    72,
    0,
    12,
    0,
    1,
    0,
    1,
    0,
    27,
    0,
    0,
    0,
    0,
    2.87,
    17.53207,
    4.64,
    10.73,
    0.3,
    3.37,
    24.36975,
    56.355045,
    1.5756304,
    17.699581
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198145737268' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    942,
    14629,
    0,
    2.94,
    16.43,
    10.7,
    6.39,
    2.28,
    0,
    0,
    0,
    40.95652,
    84.821884,
    15.17811,
    0,
    55.24006,
    32.98916,
    11.770779
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198145737268' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    2353,
    3425,
    1864,
    2418,
    19.37,
    0,
    0,
    19.37,
    0,
    17.19,
    2.18,
    5.7,
    2.6,
    -1,
    7,
    4.3,
    100,
    0,
    0,
    100,
    0,
    88.745476,
    11.254517,
    34.81979,
    15.882711,
    42.761147,
    26.267563
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '76561198145737268' 
        AND platform = 'steam'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    0
);

-- End of player settings for id: 76561198145737268 on steam

-- Player settings for id: Classicrunns99 on ps4

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Classicrunns99' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    110,
    170,
    0,
    400,
    0.55,
    3.8,
    1.5,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Classicrunns99' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Classicrunns99' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    598,
    0,
    12.16,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    3.34,
    0,
    0,
    0,
    100,
    0,
    0,
    0
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Classicrunns99' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    1216,
    9485,
    0,
    2.92,
    4.9,
    2.22,
    5.59,
    0,
    0,
    0,
    0,
    52.869564,
    62.659843,
    37.340153,
    0,
    28.425095,
    71.5749,
    0
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Classicrunns99' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    1684,
    0,
    1374,
    1597,
    7,
    0.82,
    0,
    7.81,
    0,
    4.47,
    3.34,
    2.4,
    4.5,
    -1,
    3.1,
    1.4,
    89.51406,
    10.485933,
    0,
    100,
    0,
    57.234314,
    42.76569,
    30.418253,
    57.03422,
    39.29024,
    17.74398
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'Classicrunns99' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    0
);

-- End of player settings for id: Classicrunns99 on ps4

-- Player settings for id: BrttBrck on ps4

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'BrttBrck' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    110,
    100,
    -3,
    270,
    0.5,
    2.5,
    1.1,
    1.1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'BrttBrck' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    1,
    0,
    0,
    0,
    0,
    0,
    24,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'BrttBrck' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    533,
    788.02686,
    49.95,
    215,
    112,
    191,
    100,
    24,
    12,
    2,
    1,
    2,
    1,
    8,
    0,
    11,
    2.87,
    17.53207,
    1.97,
    12.034208,
    5.48,
    4.57,
    3.39,
    3.99,
    31.440044,
    26.219164,
    19.449224,
    22.891565
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'BrttBrck' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    1513,
    23488,
    2,
    5.97,
    11.4,
    8.29,
    9.32,
    1.75,
    0.27,
    3,
    0.09,
    65.78261,
    58.8539,
    30.820858,
    10.325246,
    42.820248,
    48.140495,
    9.039256
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'BrttBrck' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    2156,
    1322,
    2564,
    4158,
    7.8,
    2.71,
    8.86,
    8.76,
    10.6,
    15.77,
    3.59,
    4.1,
    8.6,
    -1,
    8.1,
    3.8,
    40.26846,
    13.990708,
    45.740837,
    45.247932,
    54.752064,
    81.45661,
    18.543388,
    25.045815,
    52.535126,
    49.48076,
    23.213194
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'BrttBrck' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    0
);

-- End of player settings for id: BrttBrck on ps4

-- Player settings for id: pat-_attak on ps4

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'pat-_attak' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    110,
    100,
    -3,
    280,
    0.5,
    3.3,
    1.1,
    1.5
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'pat-_attak' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    0,
    0,
    0,
    0,
    0,
    2,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'pat-_attak' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    333,
    384.8503,
    64.41,
    105,
    0,
    50,
    0,
    55,
    0,
    1,
    0,
    5,
    0,
    52,
    0,
    0,
    0,
    0,
    2.98,
    18.204031,
    0,
    8.71,
    4.73,
    4.89,
    0,
    47.51773,
    25.804691,
    26.677578
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'pat-_attak' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    1659,
    25334,
    2.58,
    6.67,
    10.08,
    15.28,
    4.05,
    0,
    0.11,
    1,
    0.11,
    72.13043,
    52.146923,
    34.50595,
    13.347129,
    79.04811,
    20.951889,
    0
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'pat-_attak' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    4194,
    5572,
    3308,
    3795,
    10.81,
    5,
    3.51,
    13.78,
    5.55,
    19.33,
    0,
    4.8,
    2.3,
    -1,
    3.2,
    6.1,
    55.95238,
    25.879917,
    18.167702,
    71.288155,
    28.711847,
    100,
    0,
    29.32193,
    14.050091,
    19.547953,
    37.263283
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'pat-_attak' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    0
);

-- End of player settings for id: pat-_attak on ps4

-- Player settings for id: GUNSLINGER8978 on ps4

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'GUNSLINGER8978' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    110,
    100,
    -3,
    320,
    0.5,
    3.9,
    1.8,
    1.2
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'GUNSLINGER8978' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'GUNSLINGER8978' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    306,
    432.49844,
    72.99,
    118,
    0,
    100,
    0,
    18,
    0,
    1,
    0,
    2,
    0,
    0,
    0,
    0,
    4.09,
    24.984726,
    0.04,
    0.2443494,
    0.95,
    4.43,
    2.08,
    11.16,
    5.1020412,
    23.791622,
    11.170785,
    59.93556
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'GUNSLINGER8978' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    1450,
    22299,
    0.44,
    7.61,
    11.32,
    15.78,
    3.59,
    0,
    0.37,
    4,
    0.09,
    63.04348,
    58.440884,
    39.287556,
    2.2715538,
    81.46619,
    18.533815,
    0
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'GUNSLINGER8978' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    3983,
    5645,
    1675,
    3871,
    8.27,
    10.95,
    0.15,
    16.2,
    3.16,
    19.37,
    0,
    6.6,
    4.8,
    -1,
    4.4,
    5.5,
    42.694893,
    56.53072,
    0.7743935,
    83.67769,
    16.322313,
    100,
    0,
    40.317654,
    29.32193,
    26.878435,
    33.598045
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = 'GUNSLINGER8978' 
        AND platform = 'ps4'
    )',
    'a4676587-9373-401b-9de1-5ea48839f574',
    0,
    0
);

-- End of player settings for id: GUNSLINGER8978 on ps4

-- End seed data for replay: a4676587-9373-401b-9de1-5ea48839f574



-- Seed data for replay: 238ca3d7-3b3d-4680-a53b-79516e9066ac

-- Player settings for id: 256cfc97f6010900 on xbox

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '256cfc97f6010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    100,
    100,
    -3,
    290,
    0.5,
    2.5,
    1,
    1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '256cfc97f6010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    1,
    6,
    0,
    4,
    1,
    1,
    280,
    0
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '256cfc97f6010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    234,
    228.0629,
    57.19,
    1102,
    229,
    552,
    100,
    550,
    129,
    8,
    1,
    48,
    11,
    264,
    2,
    295,
    6.77,
    2.3351269,
    54.43,
    18.774143,
    32.88,
    65.55,
    80.96,
    108.3,
    11.428968,
    22.784945,
    28.141401,
    37.644688
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '256cfc97f6010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    1243,
    349210,
    13.8,
    85.02,
    200.31,
    216.03,
    82.2,
    0.9,
    0.73,
    3,
    0.24,
    54.04348,
    66.9642,
    28.422428,
    4.613379,
    72.219444,
    27.479694,
    0.30087256
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '256cfc97f6010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    2444,
    2174,
    2557,
    3432,
    165.15,
    104.44,
    29.53,
    225.87,
    73.26,
    214.96,
    84.16,
    151.8,
    132.2,
    3,
    140.5,
    143.8,
    55.211956,
    34.915752,
    9.8722925,
    75.50897,
    24.491024,
    71.864136,
    28.135866,
    52.35927,
    45.598785,
    48.461643,
    49.599888
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '256cfc97f6010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    1,
    1
);

-- End of player settings for id: 256cfc97f6010900 on xbox

-- Player settings for id: 9bbbb232f7010900 on xbox

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '9bbbb232f7010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    110,
    110,
    -4,
    280,
    0.5,
    5,
    1.5,
    1.25
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '9bbbb232f7010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    1,
    6,
    1,
    4,
    0,
    0,
    150,
    100
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '9bbbb232f7010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    296,
    260.96854,
    49.36,
    1261,
    57,
    939,
    0,
    322,
    57,
    12,
    0,
    28,
    5,
    274,
    2,
    107,
    43.43,
    14.979994,
    25.76,
    8.885209,
    96.87,
    55.13,
    41.6,
    84.29,
    34.859116,
    19.838783,
    14.969952,
    30.332144
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '9bbbb232f7010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    1338,
    381009,
    16.8,
    99.25,
    186.78,
    216.21,
    82.21,
    4.4,
    1.07,
    2,
    0.53,
    58.173912,
    61.678173,
    32.774166,
    5.547667,
    71.39885,
    27.14814,
    1.4530083
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '9bbbb232f7010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    2846,
    2747,
    2954,
    3432,
    177.99,
    87.27,
    37.57,
    232.37,
    70.46,
    207.8,
    95.03,
    136.5,
    151.9,
    1,
    143.6,
    144.5,
    58.775555,
    28.81815,
    12.4063015,
    76.73283,
    23.267181,
    68.619354,
    31.38064,
    47.08195,
    52.393757,
    49.530907,
    49.84133
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '9bbbb232f7010900' 
        AND platform = 'xbox'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    2,
    0
);

-- End of player settings for id: 9bbbb232f7010900 on xbox

-- Player settings for id: 90b737843ba343c2b02a3a530ffdf825 on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    110,
    110,
    -4,
    270,
    1,
    5.3,
    1,
    1.1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    3,
    2,
    2,
    1,
    1,
    2,
    576,
    66.666664
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    397,
    401.28308,
    60.57,
    1939,
    407,
    1402,
    216,
    537,
    191,
    22,
    4,
    51,
    17,
    453,
    140,
    243,
    16.97,
    5.8533382,
    43.8,
    15.107615,
    50.58,
    43.9,
    89.31,
    109.83,
    17.226347,
    14.951298,
    30.416866,
    37.40549
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    1459,
    411738,
    23.14,
    132.46,
    145.85,
    190.57,
    107.65,
    3.23,
    8.03,
    70,
    0.11,
    63.434784,
    48.382816,
    43.940952,
    7.6762314,
    63.217777,
    35.71073,
    1.0714878
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    2271,
    2123,
    2442,
    2818,
    113.97,
    102.86,
    84.63,
    165.53,
    135.92,
    243.6,
    57.86,
    141.8,
    148.6,
    1,
    154.3,
    136.1,
    37.806007,
    34.12061,
    28.073374,
    54.91126,
    45.088737,
    80.80673,
    19.193258,
    48.91004,
    51.25552,
    53.221577,
    46.943985
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    1,
    1
);

-- End of player settings for id: 90b737843ba343c2b02a3a530ffdf825 on epic

-- Player settings for id: 995a75abf4184485ad59186cd79a3497 on epic

INSERT INTO player_settings (player_id, replay_id, fov, height, pitch, distance, stiffness, 
    swivel_speed, transition_speed, steering_sensitivity) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    110,
    110,
    -4,
    330,
    1,
    5.4,
    1,
    1.1
);

INSERT INTO player_core_stats (player_id, replay_id, shots, shots_against, goals, goals_against, saves, 
    assists, score, shooting_percentage) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    3,
    2,
    2,
    1,
    1,
    2,
    478,
    66.666664
);

INSERT INTO player_boost_stats (player_id, replay_id, bpm, bcpm, avg_amount, amount_collected, 
    amount_stolen, amount_collected_big, amount_stolen_big, amount_collected_small, amount_stolen_small, 
    count_collected_big, count_stolen_big, count_collected_small, count_stolen_small, amount_overfill, 
    amount_overfill_stolen, amount_used_while_supersonic, time_zero_boost, percent_zero_boost, 
    time_full_boost, percent_full_boost, time_boost_0_25, time_boost_25_50, time_boost_50_75, 
    time_boost_75_100, percent_boost_0_25, percent_boost_25_50, percent_boost_50_75, percent_boost_75_100) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    264,
    278.35263,
    45.56,
    1345,
    385,
    773,
    200,
    572,
    185,
    9,
    2,
    52,
    18,
    155,
    14,
    178,
    35.84,
    12.36203,
    25.33,
    8.736893,
    99.06,
    65.84,
    60.83,
    59.73,
    34.701885,
    23.064526,
    21.309465,
    20.924124
);

INSERT INTO player_movement_stats (player_id, replay_id, avg_speed, total_distance, time_supersonic_speed, 
    time_boost_speed, time_slow_speed, time_ground, time_low_air, time_high_air, time_powerslide, 
    count_powerslide, avg_powerslide_duration, avg_speed_percentage, percent_slow_speed, 
    percent_boost_speed, percent_supersonic_speed, percent_ground, percent_low_air, percent_high_air) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    1279,
    356759,
    11.49,
    97.61,
    189.23,
    198.78,
    98.64,
    0.9,
    4.1,
    11,
    0.37,
    55.608696,
    63.42976,
    32.718803,
    3.85144,
    66.63315,
    33.065166,
    0.30168948
);

INSERT INTO player_positioning_stats (player_id, replay_id, avg_distance_to_ball, 
    avg_distance_to_ball_possession, avg_distance_to_ball_no_possession, avg_distance_to_mates, 
    time_defensive_third, time_neutral_third, time_offensive_third, time_defensive_half, 
    time_offensive_half, time_behind_ball, time_infront_ball, time_most_back, time_most_forward, 
    goals_against_while_last_defender, time_closest_to_ball, time_farthest_from_ball, 
    percent_defensive_third, percent_neutral_third, percent_offensive_third, percent_defensive_half, 
    percent_offensive_half, percent_behind_ball, percent_infront_ball, percent_most_back, 
    percent_most_forward, percent_closest_to_ball, percent_farthest_from_ball) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    2466,
    2594,
    2235,
    2818,
    112.55,
    111.07,
    74.7,
    169.82,
    128.5,
    233.43,
    64.9,
    151.4,
    135.2,
    -1,
    129.7,
    156.9,
    37.727943,
    37.23183,
    25.040222,
    56.92545,
    43.07455,
    78.24557,
    21.754435,
    52.2213,
    46.633553,
    44.736477,
    54.11837
);

INSERT INTO player_demo_stats (player_id, replay_id, inflicted, taken) 
VALUES (
    '(
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    )',
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    0,
    2
);

-- End of player settings for id: 995a75abf4184485ad59186cd79a3497 on epic

-- End seed data for replay: 238ca3d7-3b3d-4680-a53b-79516e9066ac



