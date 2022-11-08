--in and not in
--[dbo].[employee]
select * from employee

--find the employees from departments admin and hr?
select emp_NAME,DEPT_NAME
from employee
where DEPT_NAME in ('hr','admin')

--FIND THE EMPLOYEES WHO ARE NOT FROM DEPARTMENTS ADMIN AND HR?
select emp_NAME, DEPT_NAME
from employee 
where DEPT_NAME not in ('hr','admin')