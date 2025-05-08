-- Create the database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Create Authors Table
CREATE TABLE IF NOT EXISTS authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(50)
);

-- Create Books Table
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    genre VARCHAR(50),
    publication_date DATE,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE SET NULL
);

-- Create Patrons Table
CREATE TABLE IF NOT EXISTS patrons (
    patron_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    registration_date DATE DEFAULT CURRENT_DATE
);

-- Create Loans Table
CREATE TABLE IF NOT EXISTS loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    patron_id INT,
    book_id INT,
    loan_date DATE DEFAULT CURRENT_DATE,
    return_date DATE,
    FOREIGN KEY (patron_id) REFERENCES patrons(patron_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);

-- Sample Insert Data
-- Inserting authors
INSERT INTO authors (name, birthdate, nationality) VALUES
('J.K. Rowling', '1965-07-31', 'British'),
('George Orwell', '1903-06-25', 'British');

-- Inserting books
INSERT INTO books (title, genre, publication_date, author_id) VALUES
('Harry Potter and the Sorcerer\'s Stone', 'Fantasy', '1997-06-26', 1),
('1984', 'Dystopian', '1949-06-08', 2);

-- Inserting patrons
INSERT INTO patrons (first_name, last_name, email, phone_number) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210');

-- Inserting loans
INSERT INTO loans (patron_id, book_id, loan_date) VALUES
(1, 1, '2025-05-01'),
(2, 2, '2025-05-02');
