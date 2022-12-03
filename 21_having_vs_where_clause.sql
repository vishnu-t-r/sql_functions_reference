--[dbo].[employee]
select * from employee

--where
--find the employees who receive a salary > 6000
select emp_NAME,SALARY
from employee
where SALARY > 6000

--HAVING
--FIND DEPT WHICH PROVIDE A TOTAL SALARY > 25000?
select DEPT_NAME,sum(SALARY) as total_salary
from employee
group by DEPT_NAME
having sum(SALARY) > 25000



--USING SUBQUERY AND WHERE CLAUSE
select DEPT_NAME, total_salary
from
(
select DEPT_NAME,sum(SALARY) as total_salary
from employee
group by DEPT_NAME
) a
where total_salary > 25000