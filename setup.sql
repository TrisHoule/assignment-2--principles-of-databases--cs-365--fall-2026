CREATE DATABASE IF NOT EXISTS passwords;

USE passwords;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE websites (
    website_id INT PRIMARY KEY,
    website_name VARCHAR(100) NOT NULL,
    url VARCHAR(255) NOT NULL
);

CREATE TABLE password_entries (
    entry_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    website_id INT NOT NULL,
    encrypted_password BLOB NOT NULL,
    comment VARCHAR(255),
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (website_id) REFERENCES websites(website_id)
);

INSERT INTO users (user_id, first_name, last_name, username, email)
VALUES (1, 'Alex', 'Smith', 'alexsmith', 'alex.smith@example.com');

INSERT INTO websites (website_id, website_name, url)
VALUES (1, 'GitHub', 'https://github.com');

INSERT INTO websites (website_id, website_name, url)
VALUES (2, 'MySQL', 'https://www.mysql.com');

INSERT INTO websites (website_id, website_name, url)
VALUES (3, 'Wikipedia', 'https://www.wikipedia.org');

INSERT INTO websites (website_id, website_name, url)
VALUES (4, 'Reddit', 'https://www.reddit.com');

INSERT INTO websites (website_id, website_name, url)
VALUES (5, 'Spotify', 'https://www.spotify.com');

INSERT INTO websites (website_id, website_name, url)
VALUES (6, 'Netflix', 'https://www.netflix.com');

INSERT INTO websites (website_id, website_name, url)
VALUES (7, 'Amazon', 'https://www.amazon.com');

INSERT INTO websites (website_id, website_name, url)
VALUES (8, 'YouTube', 'https://www.youtube.com');

INSERT INTO websites (website_id, website_name, url)
VALUES (9, 'MLB', 'https://www.mlb.com');

INSERT INTO websites (website_id, website_name, url)
VALUES (10, 'ESPN', 'https://www.espn.com');

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    1, 1, 1,
    AES_ENCRYPT('PracticePass01!', 'demo_key'),
    'Sample GitHub account',
    '2026-10-01 10:00:00'
);

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    2, 1, 2,
    AES_ENCRYPT('PracticePass02!', 'demo_key'),
    'Sample MySQL account',
    '2026-10-01 11:00:00'
);

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    3, 1, 3,
    AES_ENCRYPT('PracticePass03!', 'demo_key'),
    'Sample Wikipedia account',
    '2026-10-01 12:00:00'
);

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    4, 1, 4,
    AES_ENCRYPT('PracticePass04!', 'demo_key'),
    'Sample Reddit account',
    '2026-10-01 13:00:00'
);

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    5, 1, 5,
    AES_ENCRYPT('PracticePass05!', 'demo_key'),
    'Sample Spotify account',
    '2026-10-01 14:00:00'
);

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    6, 1, 6,
    AES_ENCRYPT('PracticePass06!', 'demo_key'),
    'Sample Netflix account',
    '2026-10-01 15:00:00'
);

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    7, 1, 7,
    AES_ENCRYPT('PracticePass07!', 'demo_key'),
    'Sample Amazon account',
    '2026-10-01 16:00:00'
);

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    8, 1, 8,
    AES_ENCRYPT('PracticePass08!', 'demo_key'),
    'Sample YouTube account',
    '2026-10-01 17:00:00'
);

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    9, 1, 9,
    AES_ENCRYPT('PracticePass09!', 'demo_key'),
    'Sample MLB account',
    '2026-10-01 18:00:00'
);

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    10, 1, 10,
    AES_ENCRYPT('PracticePass10!', 'demo_key'),
    'Sample ESPN account',
    '2026-10-01 19:00:00'
);