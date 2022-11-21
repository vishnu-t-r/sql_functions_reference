--employee
select * from employee

--duplicate record query
select emp_ID,count(*) as id_count from employee
group by emp_ID
having count(*) > 1

--enter duplicate record
insert into employee(emp_ID,emp_NAME,DEPT_NAME,SALARY)
values(125,'Mohan','Admin',4000)


--DUPLICATE NAME IN THE TABLE
select emp_NAME,count(*) as name_count from employee
group by emp_NAME
--ORDER BY count(*) desc
having count(*) > 1