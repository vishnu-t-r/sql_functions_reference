/*
CREATE TABLE student_bit_op(
		ID INTEGER NOT NULL,	
		Name VARCHAR(100),	
		Physics INTEGER,	
		Chemistry INTEGER,
		UNIQUE(ID)
		);
*/
/*
TRUNCATE TABLE student_bit_op;
GO

-- import the file
BULK INSERT student_bit_op --table to which we need to insert values
FROM 'C:\Users\91740\Downloads\student_bit_op.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO
*/
select * from student_bit_op

SELECT Physics & Chemistry FROM student_bit_op;

SELECT Physics | Chemistry FROM student_bit_op;

