/*
create table ungroup(
id int not null unique,
item_name varchar(255),
item_count int
)

insert into ungroup(id,item_name,item_count)
values(1,'bottle',2)
,(2,'tent',1)
,(3,'apple',4)
*/

--select * from ungroup

with item as 
(
select id,item_name,item_count from ungroup

union all

select id,item_name,(item_count - 1) as item_count
from item
where item_count > 1
)
select id,item_name,item_count from item
order by id,item_count



