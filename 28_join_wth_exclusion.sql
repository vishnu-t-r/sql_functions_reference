--Join with exclusion
/*
--store_a table
create table store_a(
a_id int,
name varchar(32)
)

insert into store_a(a_id,name)
values(1,'apple'),
(2,'orange'),
(3,'tomato'),
(4,'mango')

--store_b table
create table store_b(
b_id int,
name varchar(32)
)

insert into store_b(b_id,name)
values(8,'apple'),
(9,'banana'),
(10,'mango'),
(11,'watermelon')

*/

select * from store_a
select * from store_b

--Question?
--fruits that are only available in store_a ?
	--result set should contain the name of fruit ('name' column)
--fruits that are only available in store_b ?
	--result set should contain the name of fruit ('name' column)
--fruits that are exculsive to a store ?
	--result set should contain the name of fruit ('name' column)

select a.name
from store_a a
left join store_b b
on a.name = b.name
where b.name is null

select b.name
from store_a a
right join store_b b
on a.name = b.name
where a.name is null

select (case when a.name is not null then a.name
			else b.name end) as name
from store_a a
full outer join store_b b
on a.name = b.name
where a.name is null 
or b.name is null
