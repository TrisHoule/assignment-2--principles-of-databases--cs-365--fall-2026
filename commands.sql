USE passwords;

-- Create a new entry.

INSERT INTO websites (website_id, website_name, url)
VALUES (11, 'Twitch', 'https://www.twitch.tv');

INSERT INTO password_entries (
    entry_id,
    user_id,
    website_id,
    encrypted_password,
    comment,
    created_at
)
VALUES (
    11, 1, 11,
    AES_ENCRYPT('PracticePass1!', 'demo_key'),
    'Sample Twitch account',
    '2026-10-02 10:00:00'
);

-- Get the password associated with a website URL.

SELECT CAST(
    AES_DECRYPT(password_entries.encrypted_password, 'demo_key')
    AS CHAR
) AS decrypted_password
FROM password_entries
JOIN websites
    ON password_entries.website_id = websites.website_id
WHERE websites.url = 'https://github.com';

-- Get all password-related data for two HTTPS entries.

SELECT
    password_entries.entry_id,
    users.user_id,
    users.first_name,
    users.last_name,
    users.username,
    users.email,
    websites.website_id,
    websites.website_name,
    websites.url,
    password_entries.encrypted_password,
    CAST(
        AES_DECRYPT(password_entries.encrypted_password, 'demo_key')
        AS CHAR
    ) AS decrypted_password,
    password_entries.comment,
    password_entries.created_at
FROM password_entries
JOIN users
    ON password_entries.user_id = users.user_id
JOIN websites
    ON password_entries.website_id = websites.website_id
WHERE websites.url LIKE 'https://%'
    AND websites.website_id IN (1, 2);

-- Change a website URL.

UPDATE websites
SET url = 'https://en.wikipedia.org'
WHERE website_id = 3;

-- Change an existing password.

UPDATE password_entries
SET encrypted_password = AES_ENCRYPT('UpdatedPass1!', 'demo_key')
WHERE entry_id = 1;

-- Remove a password entry based on a URL.

DELETE FROM password_entries
WHERE website_id IN (
    SELECT website_id
    FROM websites
    WHERE url = 'https://www.reddit.com'
);

-- Remove a password entry based on its password.

DELETE FROM password_entries
WHERE encrypted_password = AES_ENCRYPT('PracticePass05!', 'demo_key');