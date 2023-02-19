/*
CREATE TABLE ExamResult
(StudentName VARCHAR(70), 
 Subject     VARCHAR(20), 
 Marks       INT
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'Maths', 
 65
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'Science', 
 80
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'english', 
 70
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'Maths', 
 50
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'Science', 
 70
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'english', 
 90
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'Maths', 
 55
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'Science', 
 60
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'english', 
 89
);
*/

select * from ExamResult

--ROW NUMBER
--ROW_Number() SQL RANK function to get a unique sequential number for each row in the specified data. 
--It gives the rank one for the first row and then increments the value by one for each row.

--RANK & DENSE RANK
--RANK() AND DENSE_RANK() SQL Rank function to specify rank for each row in the result

select *
		,ROW_NUMBER() OVER(ORDER BY Marks) as rownumber
		,RANK() OVER(PARTITION BY StudentName ORDER BY Marks DESC) Rnk
		,DENSE_RANK() OVER(PARTITION BY StudentName ORDER BY Marks DESC) Dense_Rnk
from ExamResult
order by StudentName, Marks DESC