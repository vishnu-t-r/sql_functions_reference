----displaying 1 to 10 using recursive sql

WITH numbers AS
	(SELECT 1 AS n--, 1 as level_test
	UNION ALL
	SELECT n + 1 as n--, level_test+1 as level_test
	FROM numbers
	WHERE n < 10
	)
select * from numbers;

select 1
where 1 = 2


----find ancestors of a person
--select * from parentof
/*
create table parentof
(
parent varchar(255) not null,
child varchar(255) not null
)
*/
/*
insert into parentof(parent,child)
values('alice','carol')
,('bob','carol')
,('carol','dave')
,('carol','george')
,('dave','mary')
,('eve','mary')
,('mary','frank')
*/

with ancestor as
	(
	select parent from parentof
	where child = 'george'

	union all

	select po.parent from ancestor
	inner join --or join
	parentof po
	on 
	ancestor.parent = po.child
	)
select * from ancestor;

--find the hierarchy of employees under a given manager
/*
CREATE TABLE emp_details(
id int not null identity(1,1),--auto_increment
name varchar(255),
manager_id int,
designation varchar(255)
)

insert into emp_details(name,manager_id,designation)
values('shripadh',NULL,'ceo')
,('satya',5,'software engineer')
,('jia',5,'data analyst')
,('david',5,'data scientist')
,('michael',7,'manager')
,('aravind',7,'architect')
,('asha',1,'cto')
,('mariyam',1,'manager')
,('reshma',8,'business anayst')
,('akshay',8,'java developer')

*/
select * from emp_details










select concat('hello ','->','world') as test_concat
select 'hello '+'->'+' world' as test_concat



	