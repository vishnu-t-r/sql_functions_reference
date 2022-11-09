--employee table

--and
--or
--not

--and 
select top 10 * from employee

--find the employees who belong to hr department and whose salary is > 3000?
select emp_NAME, DEPT_NAME, SALARY
from employee
where DEPT_NAME = 'hr'
and 
SALARY > 3000

--or
--find the employees who belong to 'Finance' dept or whose salary is greater than 6000?
select emp_NAME, DEPT_NAME, SALARY
from employee
where DEPT_NAME = 'Finance'
or
SALARY > 6000

--not 
--find employees who does not belong to hr dept?
select emp_NAME, DEPT_NAME
from employee
where NOT DEPT_NAME = 'HR'
--where DEPT_NAME IN ('Finance','Admin','IT')




