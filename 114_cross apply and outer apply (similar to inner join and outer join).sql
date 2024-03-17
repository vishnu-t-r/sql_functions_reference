--CREATE DATABASE Library
 
--GO 
 
USE Library;

/* 
CREATE TABLE Author
(
    id INT PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL,
    
 )
 
CREATE TABLE Book
(
    id INT PRIMARY KEY,
    book_name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    author_id INT NOT NULL
   
 )
 
USE Library;
 
 INSERT INTO Author 
 
VALUES
(1, 'Author1'),
(2, 'Author2'),
(3, 'Author3'),
(4, 'Author4'),
(5, 'Author5'),
(6, 'Author6'),
(7, 'Author7')
 
 
INSERT INTO Book 
 
VALUES
(1, 'Book1',500, 1),
(2, 'Book2', 300 ,2),
(3, 'Book3',700, 1),
(4, 'Book4',400, 3),
(5, 'Book5',650, 5),
(6, 'Book6',400, 3)
*/


select * from Author
select * from Book

--Joining tables using JOIN operators
--INNER JOIN operator to retrieve matching rows from both of the tables

SELECT A.author_name, B.id, B.book_name, B.price
FROM Author A
INNER JOIN Book B
ON A.id = B.author_id

--retrieve all the records from Author table use LEFT JOIN

SELECT A.author_name, B.id, B.book_name, B.price
FROM Author A
LEFT JOIN Book B
ON A.id = B.author_id

--Joining table valued functions with tables using APPLY operators

--join operators cannot be used to join a table valued function with a table
--table valued function is a function that returns records in the form of a table

--simple table valued function that accepts author id as parameter and returns all the books written by that author

CREATE FUNCTION fnGetBooksByAuthorId(@AuthorId int)
RETURNS TABLE
AS
RETURN
( 
SELECT * FROM Book
WHERE author_id = @AuthorId
)

--executing the function

SELECT * FROM fnGetBooksByAuthorId(3)


--try to use an INNER JOIN operator to join the Author table with the table valued function fnGetBooksByAuthorId

/*
SELECT A.author_name, B.id, B.book_name, B.price
FROM Author A
INNER JOIN fnGetBooksByAuthorId(A.Id) B
ON A.id = B.author_id
*/ --this script will output error message

--so instead use CROSS APPLY

SELECT A.author_name, B.id, B.book_name, B.price
FROM Author A
CROSS APPLY fnGetBooksByAuthorId(A.Id) B
/*retrieves all the records from the table where there are 
corresponding matching rows in the output returned by the table valued function*/
/*similar to INNER JOIN*/

--using OUTER APPLY
SELECT A.author_name, B.id, B.book_name, B.price
FROM Author A
OUTER APPLY fnGetBooksByAuthorId(A.Id) B

/*retrieve all the rows from both the physical table and the output of the table valued function*/

--saw how to perform join operations between a physical table and table valued function.





