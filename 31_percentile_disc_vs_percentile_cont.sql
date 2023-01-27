--compare and understand percentile_cont and percentile-disc


/*
--employee_salary table
create table employee_salary(
name varchar(50),
department varchar(50),
salary int
)


--INSERT VALUES
insert into employee_salary(name,department,salary)
values('Lewis','Finance',11000),
('Toto','Finance',5200),
('George','Finance',6000),
('James','Finance',4100),
('Allison','Finance',3500),
('Mick','Finance',2500),
('Max','HR',9000),
('Christian','HR',3600),
('Checo','HR',5000),
('Marko','HR',3400),
('Adrian','HR',4000)

*/

select * from employee_salary

--?find the median emplyee salary for each department
select department
		,max(disc_percentile) as disc_percentile
		,max(cont_percentile) as cont_percentile
from
(
select department	
		,percentile_disc(0.5) within group(order by salary asc) 
		over(partition by department) as disc_percentile
		,percentile_cont(0.5) within group(order by salary asc) 
		over(partition by department) as cont_percentile
from employee_salary
) a
group by department
