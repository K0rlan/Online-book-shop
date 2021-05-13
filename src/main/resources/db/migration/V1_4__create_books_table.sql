CREATE TABLE IF NOT EXISTS books (
          book_id serial PRIMARY KEY,
          book_name varchar(255) NOT NULL,
          book_author varchar(255) NOT NULL,
          book_img varchar(255) NOT NULL,
          book_description varchar(255) NOT NULL,
          book_price double precision NOT NULL,
          book_year integer NOT NULL
);
