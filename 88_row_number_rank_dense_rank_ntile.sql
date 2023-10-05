--sql rank function overview
/*
ROW_NUMBER()
RANK()
DENSE_RANK()
NTILE()
*/

--create a table examresult

/*
CREATE TABLE examresult
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

select * from examresult

--row_number()
	--to get a unique sequential number for each row
	--number will not be repeated

select studentname,
		subject,
		marks,
		row_number() over(order by marks asc) row_num
from examresult

--also with partition
select studentname,
		subject,
		marks,
		row_number() over(partition by subject order by marks desc) row_num
from examresult

--rank()
	--specify rank for each row in the result set
	--if two students gets the same mark there rank will also be same

select studentname,
		subject,
		marks,
		rank() over(order by marks asc) rank_num
from examresult

--? rank the result of students as per their marks in the subjects.
	--(for a student rank marks for each subject for a particular student)

select studentname,
		subject,
		marks,
		row_number() over(partition by studentname order by marks desc) rank_num
from examresult

--? rank students based on marks for each subject and find who scores the max for each subject?
	--(for a subject rank marks obtained by each student)

select * from 
(
select studentname,
		subject,
		marks,
		row_number() over(partition by subject order by marks desc) rank_num
from examresult
) a
where rank_num = 1


--dense_rank()
	--specify a unique rank but different from rank() function
	--rank will be incremented by 1
	--ie. there is no gap in the rank

select studentname,
		subject,
		marks,
		dense_rank() over(order by marks asc) dense_rank_num
from examresult

--with partition
select studentname,
		subject,
		marks,
		dense_rank() over(partition by studentname order by marks desc) dense_rank_num
from examresult


--ntile()
	--distribute rows into specified number of groups
	--each row group get its rank as per the condition

select * from examresult

select studentname,
	subject,
	marks,
	ntile(2) over(order by marks asc) as row_group
from examresult

select studentname,
	subject,
	marks,
	ntile(3) over(order by marks asc) as row_group
from examresult

--using partition 
select studentname,
	subject,
	marks,
	ntile(2) over(partition by studentname order by marks desc) as row_group
from examresult
