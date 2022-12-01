--[dbo].[employee]
--having
--having clause is the substitute of where clause for aggregate funstion

select * from employee

--?FIND THE DEPT'S, WHICH PROVIDE THE EMPLOYEES TOTAL SALARY > 25000

select DEPT_NAME, sum(SALARY) as total_salary
from employee
group by DEPT_NAME
having sum(SALARY) > 25000