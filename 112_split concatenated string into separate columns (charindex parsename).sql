--split concatenated strings into seperate columns
--using two methods

	--CHARINDEX
	--PARSENAME

use int_ques;

/*
create table review(
customer_id int,
comments varchar(100)
)

insert into review(customer_id, comments)
values(1,'good/okay/bad/satisfactory'),
(2,'excellent/good/satisafactory/bad'),
(3,'good/excellent/bad/very bad'),
(4,'satisafactory/good/very good/bad')

*/

/*
create table student(
id int,
name varchar(20)
)

insert into student(id, name)
values(1,'Prince, Clint'),
(2,'Andrews, Calvin'),
(3,'Dillon, Esther'),
(4,'Maxwell, Gene')
*/

--using charindex
select * from student;

select id,
		name,
		charindex(',',name) as char_ind,
		left(name,charindex(',',name)-1) as last_name,
		right(name,len(name)-charindex(',',name)) as first_name
from student



--using parsename

select * from review

select customer_id,
		parsename(replace(comments,'/','.'),1) as first_comment,
		parsename(replace(comments,'/','.'),2) as second_comment,
		parsename(replace(comments,'/','.'),3) as thrird_comment,
		parsename(replace(comments,'/','.'),4) as fourth_comment
from review