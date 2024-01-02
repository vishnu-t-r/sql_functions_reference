use questions;


create table store_one(
product varchar(20)
)

insert into store_one(product)
values('A'),('B'),('C'),('E'),('F'),('G'),('J'),('K')


create table store_two(
product varchar(20)
)

insert into store_two(product)
values('A'),('B'),('C'),('D'),('E'),('H'),('I'),('L')

select * from store_one
select * from store_two


--INNER JOIN
--products available in both the stores
SELECT * FROM store_one
INNER JOIN store_two
ON store_one.product = store_two.product

--RIGHT JOIN
--product available in only store_two + common products
SELECT * FROM store_one
RIGHT JOIN store_two
ON store_one.product = store_two.product


--LEFT JOIN
--product available in only store_one + common products
SELECT * FROM store_one
LEFT JOIN store_two
ON store_one.product = store_two.product


--FULL OUTER JOIN
--products available in both the stores
SELECT * FROM store_one
full outer JOIN store_two
ON store_one.product = store_two.product


--CROSS JOIN
--cartesian product
SELECT * FROM store_one,store_two

--RIGHT JOIN WITH EXCLUSION
--product available in only store_two
SELECT * FROM store_one
RIGHT JOIN store_two
ON store_one.product = store_two.product
where store_one.product is null


--LEFT JOIN WITH EXCLUSION
--product available in only store_one
SELECT * FROM store_one
LEFT JOIN store_two
ON store_one.product = store_two.product
WHERE store_two.product IS NULL


--UNION
select * from store_one
union
select * from store_two


--UNION ALL
select * from store_one
union all
select * from store_two
