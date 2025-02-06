--concept of joins with null an duplicate values
use sql_challenge;
--Example 1

/*
create table tab1(id1 int);

create table tab2(id2 int);

insert into tab1
values(1),(1),(1)

insert into tab2
values(1),(1)
*/

select * from tab1;
select * from tab2;

--inner join
select * from tab1 inner join tab2 on tab1.id1 = tab2.id2;

--left join
select * from tab1 left join tab2 on tab1.id1 = tab2.id2;

--right join
select * from tab1 right join tab2 on tab1.id1 = tab2.id2;

--full outer join
select * from tab1 full outer join tab2 on tab1.id1 = tab2.id2;


--Example 2
/*
create table tab3(id3 int);

create table tab4(id4 int);

insert into tab3
values(1),(1),(null)

insert into tab4
values(1),(null)
*/

select * from tab3;
select * from tab4;

--inner join
select * from tab3 inner join tab4 on tab3.id3 = tab4.id4;

--left join
select * from tab3 left join tab4 on tab3.id3 = tab4.id4;

--right join
select * from tab3 right join tab4 on tab3.id3 = tab4.id4;

--full outer join
select * from tab3 full outer join tab4 on tab3.id3 = tab4.id4;


--Example 3

/*
create table tab5(id5 int);

create table tab6(id6 int);

insert into tab5
values(1),(null),(2),(2),(4)

insert into tab6
values(1),(null),(3),(4)
*/

select * from tab5;
select * from tab6;

--inner join (2)
select * from tab5 inner join tab6 on tab5.id5 = tab6.id6;

--left join (5)
select * from tab5 left join tab6 on tab5.id5 = tab6.id6;

--right join (4)
select * from tab5 right join tab6 on tab5.id5 = tab6.id6;

--full outer join (7)
select * from tab5 full outer join tab6 on tab5.id5 = tab6.id6;


--Example 4
/*
create table tab7(id7 int);

create table tab8(id8 int);

insert into tab7
values(1),(null),(2),(2),(null)

insert into tab8
values(1),(null),(3),(4),(null),(null),(2)
*/

select * from tab7;
select * from tab8;

--inner join (3)
select * from tab7 inner join tab8 on tab7.id7 = tab8.id8;

--left join (5)
select * from tab7 left join tab8 on tab7.id7 = tab8.id8;

--right join (8)
select * from tab7 right join tab8 on tab7.id7 = tab8.id8;

--full outer join (10)
select * from tab7 full outer join tab8 on tab7.id7 = tab8.id8;



