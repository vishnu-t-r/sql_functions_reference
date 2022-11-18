--employee
select * from employee

--order by
select * from employee
order by SALARY asc

--group by
--?count the number of employees from each department?
select DEPT_NAME, count(emp_NAME) as employee_count
from employee
group by DEPT_NAME
order by count(emp_NAME) DESC