CREATE TABLE IF NOT EXISTS admins (
          admin_id serial PRIMARY KEY,
          admin_username varchar(255) NOT NULL,
          admin_password varchar(255) NOT NULL
);
-- 1,admin@m.ru,1234
