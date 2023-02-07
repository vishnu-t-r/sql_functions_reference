--pivot data

--table
--pivot_table
/*
create table pivot_table(
name varchar(250),
data varchar(250),
id int
)

insert into pivot_table(name,data,id)
values('name','lewis',110),
('department','IT',110),
('experience','2',110),
('salary','4000',110),
('name','george',112),
('department','Finance',112),
('experience','1',112),
('salary','	2500',112)
*/

select * from pivot_table

select id
		,max(case when name = 'name' then data
		end) as Name
		,max(case when name = 'department' then data
		end) as Department
		,max(case when name = 'experience' then data
		end) as Experience
		,max(case when name = 'salary' then data
		end) as Salary
from pivot_table
group by id