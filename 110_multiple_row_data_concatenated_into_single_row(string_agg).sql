--Convert multiple row data into single row concatenated and delimited data

use questions;


/*
create table teacher_subject(
teacher varchar(50),
subject varchar(50)
)


insert into teacher_subject(teacher, subject)
values('James','Maths'),
('James','Physics'),
('Amy','Geography'),
('Amy','History'),
('Lesley','Psychology'),
('Lesley','Literature'),
('Lesley','Sociology'),
('Morton','Art'),
('Morton','Music'),
('Morton','Drama')

*/


select * from teacher_subject;


select teacher, 
		string_agg(subject,' / ') 
		within group (order by subject asc) as subjects
from teacher_subject
group by teacher
