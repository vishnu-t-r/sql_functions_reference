----using nested if...... else
----nested used because no else if avaiable in sql
/*
create table course_table(
id int not null,
name varchar(255),
price int
)


insert into course_table(id,name,price)
values(1,'sql',1000)
,(2,'pl/sql',1200)
,(3,'ms-sql',900)
,(4,'hadoop',1100)

*/

declare @id_course int;
set @id_course = 2;

if @id_course <= 1
	begin
		if @id_course = 1
			select * from course_table where id = 1
		else
			select * from course_table where id < 1
	end
else 
select * from course_table where id > 1