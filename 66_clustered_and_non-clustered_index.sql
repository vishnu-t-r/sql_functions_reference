
USE questions;

--create 'books' table
CREATE TABLE Books
(
id INT PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
category VARCHAR(50) NOT NULL,
price INT NOT NULL
)

INSERT INTO Books
VALUES
(1, 'Book1', 'Cat1', 1800),
(2, 'Book2', 'Cat2', 1500),
(3, 'Book3', 'Cat3', 2000),
(4, 'Book4', 'Cat4', 1300),
(5, 'Book5', 'Cat5', 1500),
(6, 'Book6', 'Cat6', 5000),
(7, 'Book7', 'Cat7', 8000),
(8, 'Book8', 'Cat8', 5000),
(9, 'Book9', 'Cat9', 5400),
(10, 'Book10', 'Cat10', 3200)

--Clustered indexes
--https://www.sqlshack.com/using-sql-create-index-to-create-clustered-and-non-clustered-indexes/

--To see the default index
EXECUTE sp_helpindex Books

--syntax
CREATE CLUSTERED INDEX <index_name>
ON <table_name>(<column_name> ASC/DESC)

--test create clustered index
CREATE CLUSTERED INDEX test_index_name
ON Books(name)

--remove the default clustered index created by the primary key constraint
ALTER TABLE Books
DROP CONSTRAINT PK__Books__3213E83F7BC05CC2
GO

--create a clustered index
CREATE CLUSTERED INDEX ind_book_price
ON Books(price ASC)

--view the data to see the default order of sort
SELECT * FROM Books


--Non-clustered indexes

--syntax
CREATE NONCLUSTERED INDEX <index_name>
ON <table_name>(<column_name> ASC/DESC)

--create a non clustered index
CREATE NONCLUSTERED INDEX ind_book_name
ON Books(name ASC)

--create a second non-clustered index
CREATE NONCLUSTERED INDEX ind_book_category
ON Books(category asc)

select * from Books


--drop index
--syntax
DROP INDEX table_name.index_name;

DROP INDEX Books.ind_book_category;
DROP INDEX Books.ind_book_price