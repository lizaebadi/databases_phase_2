TRUNCATE TABLE user_accounts, posts  RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO user_accounts (email_address, username) VALUES ('david@gmail.com', 'David2022');
INSERT INTO user_accounts (email_address, username) VALUES ('john@gmail.com', 'John123');


INSERT INTO posts (title, content, number_of_views, user_account_id) VALUES ('Post Title 1', 'Post Contents 1', '403', '1');
INSERT INTO posts (title, content, number_of_views, user_account_id) VALUES ('Post Title 2', 'Post Contents 2', '245', '2');