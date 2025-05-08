# week-8-database-assignment-
---


Library Management System

## Overview

This is a simple **Library Management System** built using MySQL. The system is designed to track **books**, **authors**, **patrons**, and **book loans** in a library. The database supports operations such as adding new books, registering patrons, and keeping track of which patrons have borrowed which books.

## Database Structure

The system consists of four primary tables:

1. **authors** – Stores information about book authors.
2. **books** – Stores information about the books in the library.
3. **patrons** – Stores information about the library patrons.
4. **loans** – Tracks which books have been borrowed by which patrons and when.

### Tables and Relationships

- **authors** table stores author details.
  - `author_id` (Primary Key)
  - `name` (Author's name)
  - `birthdate` (Date of birth)
  - `nationality` (Author's nationality)

- **books** table stores book details.
  - `book_id` (Primary Key)
  - `title` (Book title)
  - `genre` (Book genre)
  - `publication_date` (Date the book was published)
  - `author_id` (Foreign Key to `authors` table)

- **patrons** table stores patron details.
  - `patron_id` (Primary Key)
  - `first_name` (Patron's first name)
  - `last_name` (Patron's last name)
  - `email` (Patron's email, unique)
  - `phone_number` (Patron's phone number)
  - `registration_date` (Date the patron registered)

- **loans** table tracks book loans.
  - `loan_id` (Primary Key)
  - `patron_id` (Foreign Key to `patrons` table)
  - `book_id` (Foreign Key to `books` table)
  - `loan_date` (Date the book was borrowed)
  - `return_date` (Date the book was returned)

### Relationships

- **One-to-Many (1:M):**
  - One author can write many books (`authors` to `books`).
  - One patron can borrow many books (`patrons` to `loans`).

- **Many-to-Many (M:M):**
  - A patron can borrow multiple books, and a book can be borrowed by multiple patrons over time. This relationship is captured in the `loans` table.

## Setup Instructions

1. **Clone this repository** or download the SQL file.
   
2. **Create the database:**
   - You can execute the provided SQL script in MySQL Workbench, phpMyAdmin, or any other MySQL client to create the necessary tables and relationships.

3. **Create the database and tables:**
   - Open your MySQL client and run the following commands:
     ```sql
     CREATE DATABASE LibraryDB;
     USE LibraryDB;
     ```
   - Then, run the provided SQL script to create the tables and relationships.

4. **Insert sample data (Optional):**
   - The script includes sample data for authors, books, patrons, and loans. You can run the sample insert statements after creating the tables to populate the database with initial data.

5. **Accessing the database:**
   - Use MySQL client tools or write SQL queries in your application to interact with the database (e.g., adding new books, registering patrons, and tracking loans).

## Example Queries

Here are some example queries to get started:

- **Get all books by a specific author:**
  ```sql
  SELECT b.title 
  FROM books b
  JOIN authors a ON b.author_id = a.author_id
  WHERE a.name = 'J.K. Rowling';
````

* **Get all books borrowed by a specific patron:**

  ```sql
  SELECT b.title, l.loan_date 
  FROM loans l
  JOIN books b ON l.book_id = b.book_id
  JOIN patrons p ON l.patron_id = p.patron_id
  WHERE p.first_name = 'John' AND p.last_name = 'Doe';
  ```

## Future Enhancements

* Implement a **due date** for each loan and calculate overdue books.
* Add a **fine** for overdue books and track fines for patrons.
* Implement **user authentication** for patrons and librarians.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```



```
