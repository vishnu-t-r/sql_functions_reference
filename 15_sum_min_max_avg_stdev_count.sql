--[dbo].[employee]
--sum
--minimum
--maximum
--standard deviation
--average
--count

select * from employee

--sum
select sum(SALARY) as total_compensation 
from employee

--total_compensation by department
select DEPT_NAME,sum(SALARY) as total_compensation
from employee
group by DEPT_NAME

--MINIMUM
--minimum salary given by the company?
select min(SALARY) as min_salary
from employee

select DEPT_NAME,min(SALARY) as min_salary
from employee
group by DEPT_NAME

--maximum
--maximum salary given by the company?
select max(SALARY) as max_salary
from employee

select DEPT_NAME,max(SALARY) as max_salary
from employee
group by DEPT_NAME

--STANDARD DEVIATION

select round(stdev(SALARY),2) as std_deviation
from employee

select DEPT_NAME, round(stdev(SALARY),2) as std_deviation
from employee
group by DEPT_NAME

--average
--find average salary offered by the company?
select avg(SALARY) as average_salary
from employee

select DEPT_NAME, round(avg(SALARY),2) as average_salary
from employee
group by DEPT_NAME


----count
select count(*) as row_count
from employee

select DEPT_NAME, count(*) as row_count
from employee
group by DEPT_NAME