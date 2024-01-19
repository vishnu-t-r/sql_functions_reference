-- 3 methods to delete duplicate data from a table

use questions;

--customer table


/*
CREATE TABLE Customer
    ( 
    [ID] INT identity(1,1), 
    [FirstName] Varchar(100), 
    [LastName] Varchar(100), 
    [Country] Varchar(100), 
    ) 
    GO 
    
Insert into Customer ([FirstName],[LastName],[Country] )
values('Raj','Gupta','India'),
('Raj','Gupta','India'),
('Mohan','Kumar','USA'),
('James','Barry','UK'),
('James','Barry','UK'),
('James','Barry','UK')

*/

-- method 1 using count and having cluase


select * from customer;

--found duplicate records
select firstname,
		lastname,
		country
from customer
group by firstname,
		lastname,
		country
having count(*) > 1


/*
select * from 
customer
where id in (select 
		max(id) as id
from customer
group by firstname,
		lastname,
		country)
*/

delete from customer
where id not in (select 
		max(id) as id
from customer
group by firstname,
		lastname,
		country)



--truncate table customer


--saving the result in a new table using the into statement

select firstname,
		lastname,
		country,
		max(id) as id
into customer_copy
from customer
group by firstname,
		lastname,
		country

select * from  customer_copy


-- method 2

-- using cte and row_number function

with cte as
(
select id,firstname,
		lastname,
		country,
		row_number() over(partition by firstname,
		lastname,
		country order by id ) as duplicate_count
from customer
)
delete from cte
where duplicate_count > 1;

--method 3

--using inner join and rank function

delete b
from customer b
inner join 
(
select *,
		rank() over(partition by firstname, lastname, country order by id) as rnk
from customer
) a
on b.id = a.id
where a.rnk > 1
