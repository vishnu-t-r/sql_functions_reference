
---create table a
/*
create table table_a(
column_a int
)
--create table b
create table table_b(
column_b int
)
*/
--drop table table_a
/*
insert into table_a(column_a)
values(1),
(2),
(3),
(4)

insert into table_b(column_b)
values(3),
(4),
(5),
(6)
*/

select * from table_a
select * from table_b

--left join
select * from
table_a a
left join table_b b
on a.column_a = b.column_b

--right join
select * from
table_a a
right join table_b b
on a.column_a = b.column_b