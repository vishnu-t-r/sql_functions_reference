-- 1) Scalar subqueries 
		--return a single value or exactly one row and exactly one column
			--using comparison operators
			
-- 2) Multirow subqueries
		--One column with multiple rows 
			--IN or NOT IN
			--ALL or ANY
		--Multiple columns with multiple rows
			--creating a derived table in from clause
			

-- 3) Correlated subqueries
		--inner query relies on information obtained from the outer query
			--EXISTS or NOT EXISTS

-- 4) Sub Query in the SELECT clause

-- 5) Sub Query in JOIN

-- 1) Scalar subqueries 
		--return a single value or exactly one row and exactly one column
			--using comparison operators

-- Question ?

--Find the list employee who receive
			--salary greater than the average company salary ?
			--salary less than the average company salary ?
select * from emp_salary

--salary greater than the average company
select * from emp_salary
where Salary > (select avg(Salary) from emp_salary)

--select avg(Salary) from emp_salary

--salary less than the average company salary ?
select * from emp_salary
where Salary < (select avg(Salary) from emp_salary)


-- 2)  Sub Query in SELECT clause

-- Question ?
--Find the difference between the salary of each employee and the average salary?
			--without using any join clause
select * from emp_salary

select Name
		,Salary
		--,(SELECT avg(Salary) from emp_salary) as avg_salary
		,Salary-(SELECT avg(Salary) from emp_salary) as diff
from emp_salary


select * 
	,Salary-avg_salary as diff
from
(select Name
		,Salary
from emp_salary
)a
cross join
(
select avg(salary) as avg_salary
from emp_salary
)b
