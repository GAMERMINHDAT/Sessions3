SET search_path TO library;

CREATE TABLE library.books (
                               book_id INT PRIMARY KEY,
                               title VARCHAR(200),
                               author VARCHAR(150),
                               published_year INT,
                               available BOOLEAN DEFAULT TRUE
);

CREATE TABLE library.members (
                                 member_id INT PRIMARY KEY,
                                 name VARCHAR(150),
                                 email VARCHAR(150) UNIQUE,
                                 join_date DATE DEFAULT CURRENT_DATE
);