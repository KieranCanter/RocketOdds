-- Seed data for replay: 9d37f8dd-3598-49b7-967c-9a013ecf5f74

INSERT INTO uploaders (steam_id, uploader_name, profile_url) 
VALUES (
    '76561199473147039',
    'imsoupergreat',
    'https://steamcommunity.com/profiles/76561199473147039/'
)
ON CONFLICT (steam_id) DO UPDATE 
SET uploader_name = EXCLUDED.uploader_name,
    profile_url = EXCLUDED.profile_url;

-- End seed data for replay: 9d37f8dd-3598-49b7-967c-9a013ecf5f74



-- Seed data for replay: 32341018-395a-446d-a3a7-cc213598cf7f

INSERT INTO uploaders (steam_id, uploader_name, profile_url) 
VALUES (
    '76561198182743805',
    'ChocMlk',
    'https://steamcommunity.com/profiles/76561198182743805/'
)
ON CONFLICT (steam_id) DO UPDATE 
SET uploader_name = EXCLUDED.uploader_name,
    profile_url = EXCLUDED.profile_url;

-- End seed data for replay: 32341018-395a-446d-a3a7-cc213598cf7f



-- Seed data for replay: 2852f730-8d9d-4658-b7cd-77bff44cde15

INSERT INTO uploaders (steam_id, uploader_name, profile_url) 
VALUES (
    '76561199240326696',
    'jeremyltong93',
    'https://steamcommunity.com/profiles/76561199240326696/'
)
ON CONFLICT (steam_id) DO UPDATE 
SET uploader_name = EXCLUDED.uploader_name,
    profile_url = EXCLUDED.profile_url;

-- End seed data for replay: 2852f730-8d9d-4658-b7cd-77bff44cde15



-- Seed data for replay: fc54e2d6-1c9e-4479-9169-e4d02b185c13

INSERT INTO uploaders (steam_id, uploader_name, profile_url) 
VALUES (
    '76561199082450226',
    'TheOnlyG77',
    'https://steamcommunity.com/profiles/76561199082450226/'
)
ON CONFLICT (steam_id) DO UPDATE 
SET uploader_name = EXCLUDED.uploader_name,
    profile_url = EXCLUDED.profile_url;

-- End seed data for replay: fc54e2d6-1c9e-4479-9169-e4d02b185c13



-- Seed data for replay: a4676587-9373-401b-9de1-5ea48839f574

INSERT INTO uploaders (steam_id, uploader_name, profile_url) 
VALUES (
    '76561198058831591',
    'Coach Twig',
    'https://steamcommunity.com/id/gormobro/'
)
ON CONFLICT (steam_id) DO UPDATE 
SET uploader_name = EXCLUDED.uploader_name,
    profile_url = EXCLUDED.profile_url;

-- End seed data for replay: a4676587-9373-401b-9de1-5ea48839f574



-- Seed data for replay: 238ca3d7-3b3d-4680-a53b-79516e9066ac

INSERT INTO uploaders (steam_id, uploader_name, profile_url) 
VALUES (
    '76561198182743805',
    'ChocMlk',
    'https://steamcommunity.com/profiles/76561198182743805/'
)
ON CONFLICT (steam_id) DO UPDATE 
SET uploader_name = EXCLUDED.uploader_name,
    profile_url = EXCLUDED.profile_url;

-- End seed data for replay: 238ca3d7-3b3d-4680-a53b-79516e9066ac



