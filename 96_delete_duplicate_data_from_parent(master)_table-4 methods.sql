use int_ques;

/*
CREATE TABLE employee_duplicate
    ( 
    [ID] INT identity(1,1), 
    [FirstName] Varchar(100), 
    [LastName] Varchar(100), 
    [Country] Varchar(100), 
    ) 
GO 
    
Insert into employee_duplicate ([FirstName],[LastName],[Country] )
values('Raj','Gupta','India'),
('Raj','Gupta','India'),
('Mohan','Kumar','USA'),
('James','Barry','UK'),
('James','Barry','UK'),
('James','Barry','UK')
*/

select * from employee_duplicate

--method_1
--using group by and count

--duplicate data
select firstname,
		lastname,
		country,
		count(1) as n
from employee_duplicate
group by firstname,
		lastname,
		country
having count(1) > 1


--method 2
--using aggregate function

delete from employee_duplicate
where id not in (
select --firstname,
		--lastname,
		--country,
		max(id) --as id
from employee_duplicate
group by firstname,
		lastname,
		country
		)

select * from employee_duplicate

--delete all records from the table and reload it with all data

delete from employee_duplicate

--run insert into statement again

--method 3
--using cte

with cte1 as 
(
select firstname,
		lastname,
		country,
		row_number() over(partition by firstname, lastname, country order by id asc) new_id
from employee_duplicate
)
--select * from cte1
delete from cte1
where new_id > 1;

select * from employee_duplicate


--delete all records from the table and reload it with all data

delete from employee_duplicate

--run insert into statement again

--method 4
--using rank function and inner join

/*
select t.*,
		r.new_id
*/
delete t
from employee_duplicate t
inner join (
select id,
		firstname,
		lastname,
		country,
		rank() over(partition by firstname, lastname, country order by id asc) new_id
from employee_duplicate
) r on t.id = r.id
where r.new_id > 1;

select * from employee_duplicate;