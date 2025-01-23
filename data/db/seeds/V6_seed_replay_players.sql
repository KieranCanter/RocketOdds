-- Seed data for replay: 9d37f8dd-3598-49b7-967c-9a013ecf5f74

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '63cd259f7edb442188c3059a2da869f4' 
        AND platform = 'epic'
    ),
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    'blue',
    'champion-1',
    '16',
    '4',
    false,
    4284,
    'Fennec',
    0,
    370.45694
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '6ee67185658f4f819a72564d44ac5010' 
        AND platform = 'epic'
    ),
    '9d37f8dd-3598-49b7-967c-9a013ecf5f74',
    'orange',
    'champion-1',
    '16',
    '3',
    true,
    4284,
    'Fennec',
    0,
    370.45694
);

-- End seed data for replay: 9d37f8dd-3598-49b7-967c-9a013ecf5f74



-- Seed data for replay: 32341018-395a-446d-a3a7-cc213598cf7f

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'c23ef2acb4214ca5b76de99337ec1dd0' 
        AND platform = 'epic'
    ),
    '32341018-395a-446d-a3a7-cc213598cf7f',
    'blue',
    'platinum-2',
    '11',
    '2',
    true,
    8807,
    'Volkswagen Golf GTI RLE',
    0,
    350.53427
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'eeac7105aca64272b5964be1fc6e1d54' 
        AND platform = 'epic'
    ),
    '32341018-395a-446d-a3a7-cc213598cf7f',
    'blue',
    'platinum-2',
    '11',
    '4',
    false,
    23,
    'Octane',
    0,
    350.53427
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    ),
    '32341018-395a-446d-a3a7-cc213598cf7f',
    'orange',
    'gold-2',
    '8',
    '2',
    false,
    23,
    'Octane',
    0,
    350.53427
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    ),
    '32341018-395a-446d-a3a7-cc213598cf7f',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    false,
    10805,
    'NULL',
    0,
    350.53427
);

-- End seed data for replay: 32341018-395a-446d-a3a7-cc213598cf7f



-- Seed data for replay: 2852f730-8d9d-4658-b7cd-77bff44cde15

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '21e5bc487bd841c99066de9d40674541' 
        AND platform = 'epic'
    ),
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    'blue',
    'silver-3',
    '6',
    '2',
    true,
    23,
    'Octane',
    0,
    391.3354
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'd995e51af0010900' 
        AND platform = 'xbox'
    ),
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    'blue',
    'silver-2',
    '5',
    '3',
    false,
    23,
    'Octane',
    0,
    391.3354
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'ea31badbb9344cb2829ba70d930534b0' 
        AND platform = 'epic'
    ),
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    'blue',
    'silver-3',
    '6',
    '2',
    false,
    23,
    'Octane',
    0,
    391.3354
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'RenzokukenX88' 
        AND platform = 'ps4'
    ),
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    'orange',
    'silver-2',
    '5',
    '4',
    false,
    402,
    'Takumi',
    0,
    291.1223
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'E100_C' 
        AND platform = 'ps4'
    ),
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    'orange',
    'silver-2',
    '5',
    '3',
    false,
    23,
    'Octane',
    0,
    320.0664
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'ac7992de05de78b0' 
        AND platform = 'psynet'
    ),
    '2852f730-8d9d-4658-b7cd-77bff44cde15',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    false,
    2269,
    'Fast & Furious Nissan Skyline',
    0,
    391.3354
);

-- End seed data for replay: 2852f730-8d9d-4658-b7cd-77bff44cde15



-- Seed data for replay: fc54e2d6-1c9e-4479-9169-e4d02b185c13

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'Deadline642' 
        AND platform = 'ps4'
    ),
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    'blue',
    'Unranked',
    'NULL',
    'NULL',
    false,
    403,
    'Dominus',
    0,
    335.95328
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '76561198311926297' 
        AND platform = 'steam'
    ),
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    'blue',
    'Unranked',
    'NULL',
    'NULL',
    false,
    23,
    'Octane',
    0,
    335.95328
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'Lolo1313s' 
        AND platform = 'ps4'
    ),
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    'blue',
    'Unranked',
    'NULL',
    'NULL',
    false,
    4284,
    'Fennec',
    52.787037,
    335.95328
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '837048efe5e14624821daa30d2beaccc' 
        AND platform = 'epic'
    ),
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    'blue',
    'Unranked',
    'NULL',
    'NULL',
    false,
    4284,
    'Fennec',
    0,
    335.95328
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
    SELECT player_id FROM players 
    WHERE display_name = 'Sabretooth' 
    AND platform_id IS NULL AND platform IS NULL
),
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    'blue',
    'Unranked',
    'NULL',
    'NULL',
    false,
    29,
    'Hotshot',
    0.13345003,
    57.75437
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '15febf35f7010900' 
        AND platform = 'xbox'
    ),
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    true,
    4155,
    'Ecto-1',
    0,
    335.95328
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'ff6dbfe7fb010900' 
        AND platform = 'xbox'
    ),
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    false,
    4284,
    'Fennec',
    0,
    335.95328
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '58620a77f8010900' 
        AND platform = 'xbox'
    ),
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    false,
    2665,
    'The Dark Knight's Tumbler',
    0,
    335.95328
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
    SELECT player_id FROM players 
    WHERE display_name = 'Sabretooth' 
    AND platform_id IS NULL AND platform IS NULL
),
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    false,
    29,
    'Hotshot',
    284.2621,
    335.95328
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '8d43d872fa010900' 
        AND platform = 'xbox'
    ),
    'fc54e2d6-1c9e-4479-9169-e4d02b185c13',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    false,
    4284,
    'Fennec',
    0,
    289.2652
);

-- End seed data for replay: fc54e2d6-1c9e-4479-9169-e4d02b185c13



-- Seed data for replay: a4676587-9373-401b-9de1-5ea48839f574

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '76561198058831591' 
        AND platform = 'steam'
    ),
    'a4676587-9373-401b-9de1-5ea48839f574',
    'blue',
    'Unranked',
    'NULL',
    'NULL',
    false,
    7532,
    'Maestro',
    0,
    19.367918
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
    SELECT player_id FROM players 
    WHERE display_name = 'Shepard' 
    AND platform_id IS NULL AND platform IS NULL
),
    'a4676587-9373-401b-9de1-5ea48839f574',
    'blue',
    'Unranked',
    'NULL',
    'NULL',
    false,
    24,
    'Paladin',
    0.14253426,
    16.488398
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '76561198145737268' 
        AND platform = 'steam'
    ),
    'a4676587-9373-401b-9de1-5ea48839f574',
    'blue',
    'Unranked',
    'NULL',
    'NULL',
    false,
    23,
    'Octane',
    0,
    19.367918
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'Classicrunns99' 
        AND platform = 'ps4'
    ),
    'a4676587-9373-401b-9de1-5ea48839f574',
    'blue',
    'Unranked',
    'NULL',
    'NULL',
    false,
    23,
    'Octane',
    11.481337,
    19.367918
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'BrttBrck' 
        AND platform = 'ps4'
    ),
    'a4676587-9373-401b-9de1-5ea48839f574',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    false,
    23,
    'Octane',
    0,
    19.367918
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'pat-_attak' 
        AND platform = 'ps4'
    ),
    'a4676587-9373-401b-9de1-5ea48839f574',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    false,
    23,
    'Octane',
    0,
    19.367918
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = 'GUNSLINGER8978' 
        AND platform = 'ps4'
    ),
    'a4676587-9373-401b-9de1-5ea48839f574',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    false,
    23,
    'Octane',
    0,
    19.367918
);

-- End seed data for replay: a4676587-9373-401b-9de1-5ea48839f574



-- Seed data for replay: 238ca3d7-3b3d-4680-a53b-79516e9066ac

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '256cfc97f6010900' 
        AND platform = 'xbox'
    ),
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    'blue',
    'platinum-3',
    '12',
    '2',
    false,
    4284,
    'Fennec',
    0,
    304.8903
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '9bbbb232f7010900' 
        AND platform = 'xbox'
    ),
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    'blue',
    'platinum-1',
    '10',
    '2',
    false,
    4284,
    'Fennec',
    0,
    304.8903
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '90b737843ba343c2b02a3a530ffdf825' 
        AND platform = 'epic'
    ),
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    'orange',
    'gold-1',
    '7',
    '3',
    true,
    23,
    'Octane',
    0,
    304.8903
);

INSERT INTO replay_players (player_id, replay_id, team_color, rank_id, rank_tier, rank_division, 
    mvp, car_id, car_name, start_time, end_time) 
VALUES (
    (
        SELECT player_id FROM players 
        WHERE platform_id = '995a75abf4184485ad59186cd79a3497' 
        AND platform = 'epic'
    ),
    '238ca3d7-3b3d-4680-a53b-79516e9066ac',
    'orange',
    'Unranked',
    'NULL',
    'NULL',
    false,
    10805,
    'NULL',
    0,
    304.8903
);

-- End seed data for replay: 238ca3d7-3b3d-4680-a53b-79516e9066ac



