-- First, insert an uploader
INSERT INTO uploaders (steam_id, name, profile_url)
VALUES ('76561198123456789', 'TestPlayer', 'https://steamcommunity.com/id/testplayer');

-- Insert a replay
INSERT INTO replays (
    replay_id, link, created, uploader_id, title, team_size, visibility
)
VALUES (
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'https://ballchasing.com/replay/test',
    CURRENT_TIMESTAMP,
    '76561198123456789',
    'Amazing 2v2 Match',
    2,
    'public'
);

-- Insert teams
INSERT INTO teams (replay_id, team_color, team_name)
VALUES 
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'blue', 'Team Blue'),
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'orange', 'Team Orange');

-- Insert team stats
INSERT INTO team_core_stats (
    replay_id, team_color, shots, goals, saves, assists, score
)
VALUES 
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'blue', 5, 2, 3, 1, 1250),
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'orange', 4, 1, 4, 1, 1100);

-- Insert players
INSERT INTO players (player_id, display_name, steam_id, platform)
VALUES 
    ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Player1', '76561198123456789', 'Steam'),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Player2', NULL, 'Epic');

-- Insert replay players
INSERT INTO replay_players (
    player_id, replay_id, team_color, rank_tier, mvp
)
VALUES 
    ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'blue', 15, true),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'orange', 14, false);

-- Now let's write some SELECT queries

-- Get basic replay info with uploader details
SELECT r.title, r.created, u.name as uploader_name
FROM replays r
JOIN uploaders u ON r.uploader_id = u.steam_id;

-- Get team scores for a specific replay
SELECT t.team_name, tcs.goals, tcs.shots, tcs.saves
FROM teams t
JOIN team_core_stats tcs ON t.replay_id = tcs.replay_id AND t.team_color = tcs.team_color
WHERE t.replay_id = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11';

-- Get player details with their team info
SELECT 
    p.display_name,
    rp.team_color,
    rp.rank_tier,
    rp.mvp
FROM players p
JOIN replay_players rp ON p.player_id = rp.player_id
WHERE rp.replay_id = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11';

-- Get a summary of all matches uploaded by a specific player
SELECT 
    r.title,
    r.created,
    tcs.goals as team_goals,
    tcs.shots as team_shots,
    t.team_color
FROM replays r
JOIN teams t ON r.replay_id = t.replay_id
JOIN team_core_stats tcs ON t.replay_id = tcs.replay_id AND t.team_color = tcs.team_color
WHERE r.uploader_id = '76561198123456789';