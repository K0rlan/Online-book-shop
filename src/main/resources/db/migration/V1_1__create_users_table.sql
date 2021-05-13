CREATE TABLE IF NOT EXISTS users (
          user_id serial PRIMARY KEY,
          user_name varchar(255) NOT NULL,
          user_password varchar(255) NOT NULL,
          user_email varchar(255) NOT NULL
);

-- 1,user@m.ru,1234,user@m.ru