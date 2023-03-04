TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, average_cooking_time, rating) VALUES ('Spaghetti Bolognese', '25', '5');
INSERT INTO recipes (name, average_cooking_time, rating) VALUES ('Tuna Sandwich', '10', '3');