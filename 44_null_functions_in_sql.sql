--sql server
	--isnull
	--coalesce

--mysql
	--ifnull
	--coalesce

--oracle
	--nvl
	--coalesce

/*
create table product(
item varchar(20),
unitssold int,
unitsonorder int,
unitprice int
)
*/
--drop table product
/*
insert into product(item,unitssold,unitsonorder,unitprice)
values('pen',100,50,20),
('book',200,null,30),
('pencil',150,50,10),
('toys',125,null,40),
('bags',100,25,50)
*/

select * from product

--find the total sales with resepect to each item ?
--isnull
select item
	,(unitssold + isnull(unitsonorder,0))*unitprice as total_sales
from 
product

--coalesce
select item
	,(unitssold + coalesce(unitsonorder,null,null,0))*unitprice as total_sales
from 
product