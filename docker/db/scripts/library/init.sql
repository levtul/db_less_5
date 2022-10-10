CREATE TABLE categories
(
    name            TEXT NOT NULL,
    parent_category TEXT,
    CONSTRAINT categories_pk PRIMARY KEY (name)
);



CREATE TABLE book_categories
(
    book_id       varchar(13) NOT NULL,
    category_name TEXT        NOT NULL,
    CONSTRAINT book_categories_pk PRIMARY KEY (book_id)
);



CREATE TABLE books
(
    isbn         varchar(13) NOT NULL,
    year         int         NOT NULL,
    name         TEXT        NOT NULL,
    author       TEXT        NOT NULL,
    pages_count  int         NOT NULL,
    publisher_id uuid        NOT NULL,
    CONSTRAINT books_pk PRIMARY KEY (isbn)
);



CREATE TABLE publishers
(
    id      uuid NOT NULL,
    name    TEXT NOT NULL,
    address TEXT NOT NULL,
    CONSTRAINT publishers_pk PRIMARY KEY (id)
);



CREATE TABLE book_copy
(
    isbn      varchar(13) NOT NULL,
    copy_id   serial      NOT NULL,
    shelf_pos TEXT        NOT NULL,
    CONSTRAINT book_copy_pk PRIMARY KEY (isbn, copy_id)
);



CREATE TABLE rent
(
    isbn      varchar(13) NOT NULL,
    copy_id   int         NOT NULL,
    reader_id uuid        NOT NULL,
    due_to    DATE        NOT NULL,
    CONSTRAINT rent_pk PRIMARY KEY (isbn, copy_id, reader_id)
);



CREATE TABLE readers
(
    id       uuid NOT NULL,
    name     TEXT NOT NULL,
    surname  TEXT NOT NULL,
    address  TEXT NOT NULL,
    birthday DATE NOT NULL,
    CONSTRAINT readers_pk PRIMARY KEY (id)
);


ALTER TABLE categories
    ADD CONSTRAINT categories_fk0 FOREIGN KEY (parent_category) REFERENCES categories (name);

ALTER TABLE book_categories
    ADD CONSTRAINT book_categories_fk0 FOREIGN KEY (book_id) REFERENCES books (isbn);
ALTER TABLE book_categories
    ADD CONSTRAINT book_categories_fk1 FOREIGN KEY (category_name) REFERENCES categories (name);

ALTER TABLE books
    ADD CONSTRAINT books_fk0 FOREIGN KEY (publisher_id) REFERENCES publishers (id);


ALTER TABLE book_copy
    ADD CONSTRAINT book_copy_fk0 FOREIGN KEY (isbn) REFERENCES books (isbn);

ALTER TABLE rent
    ADD CONSTRAINT rent_fk0 FOREIGN KEY (isbn, copy_id)
        REFERENCES book_copy (isbn, copy_id);

ALTER TABLE rent
    ADD CONSTRAINT rent_fk2 FOREIGN KEY (reader_id) REFERENCES readers (id);
