---course_table

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

--delete from course_table
--where id = 1

--select * from course_table

declare @course_id int = 4

if @course_id = 1
begin
	select * from course_table
	where id = 1
end
else
begin
	select * from course_table
	where id <> 1
end



