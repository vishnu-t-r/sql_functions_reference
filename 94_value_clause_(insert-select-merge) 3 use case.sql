--VALUES clause 


--1 - In INSERT Statement


use int_ques;

create table value_table(
id int identity(1,1) primary key,
value_name varchar(100),
value_default varchar(50) default 'default_value'
)

insert into value_table(value_name)
values('name1')

insert into value_table(value_name,value_default)
values('name2','value1'),
('name2','value2')

select * from value_table

--values clause in the insert statement have a limitaion
	--only 1000 rows at a time will only be supported
	--overcome this limitation using values clause in select clause 
	--ie. values as a derived table

--2 - VALUES in SELECT Statement

select customer_name,
		customer_id,
		amount_purchased
from(
values ('lewis',44,'40M', 'mercedes'),
		('george',63,'25M', 'mercedes'),
		('leclerc',55,'20M', 'ferrari')
) a(customer_name, customer_id, amount_purchased, team)

--using a where clause in the above statement

select customer_name,
		customer_id,
		amount_purchased
from(
values ('lewis',44,'40M', 'mercedes'),
		('george',63,'25M', 'mercedes'),
		('leclerc',55,'20M', 'ferrari')
) a(customer_name, customer_id, amount_purchased, team)
where team = 'mercedes'


--3 - VALUES in MERGE Statement

--value_table


merge value_table as target
using (
	values (3,'name3','value3'),
			(4,'name4','value4'),
			(5,'name5','value5')
) as source(id,value_name,value_default)
on target.id = source.id

when matched then 

update set target.id = source.id,
		target.value_name = source.value_name,
		target.value_default = source.value_default

when not matched by target then

insert(id, value_name, value_default)
values(source.id, source.value_name, source.value_default);


select * from value_table;


