--https://www.scaler.com/topics/sql/how-index-works-in-sql/

--ISNULL
--IFNULL 
--nullif

--is null
--is not null

--sub query usage

select Name--* 
from non_equi_join_test
where S_NO = (
				select max(S_NO)
				from non_equi_join_test
				)


--subquery along with from
select * 
from (select 
			* 
		from 
			non_equi_join_test
		)a

--group by with subquery
select * 
from (select 
			Name,SUM(S_NO) as sum_s_no
		from 
			non_equi_join_test
		group by Name
		)a

--order by is not generally used with sub query
--but along with top/limit order by used in subquery
--below query if remove 'top 1', query will give error
select * 
from (select top 1
			Name,SUM(S_NO) as sum_s_no
		from 
			non_equi_join_test
		group by Name
		order by sum_s_no
		)a

----BETWEEN operator cannot be used with a subquery.
----However, the BETWEEN operator can be used within the subquery
select * from 
(select * from non_equi_join_test
where S_NO between 10 and 30) a


select * from 
(select * from non_equi_join_test
) a
where S_NO between 10 and 30

----subquery returning multiple rows
----using numerous operator IN

select * from product
where Price IN (
				select S_NO
				from non_equi_join_test
				)

---using subquery with INSERT
---INSERT
--creating a test product table
CREATE TABLE test_product(
		ProductID INTEGER NOT NULL,
		ProductName varchar(100),
		SupplierID INTEGER,
		CategoryID INTEGER,
		Unit varchar(100),
		Price float

)

--select * from test_product
select * from product
--now from product table inserting the data into test_product table

INSERT INTO test_product
select * from product
where SupplierID in (
					select SupplierID
					from product
					where SupplierID%2 = 0
					)
--using the above insert query added only even supplier ID to test_product table
select * from test_product

--using subquery with update statement
--UPDATE
--modify existing record within the table, moslty used with SET and WHERE clause
--select * from non_equi_join_test
/*
UPDATE non_equi_join_test
SET S_NO = S_NO / 2
*/
UPDATE non_equi_join_test
SET S_NO = S_NO/2
where S_NO IN (
				select S_NO
				from non_equi_join_test
				where S_NO%20 != 0
				)

select * from non_equi_join_test

---DELETE and subquery
--deleted the Name which does not start with 'a'
DELETE FROM non_equi_join_test
WHERE S_NO IN (
				select S_NO
				from non_equi_join_test
				where Name not like 'a%'
				)

select * from non_equi_join_test

select top 10 * from employee

----subquery with EXISTS and NOT EXISTS
select top 10 * from product
select top 10 * from supplier
select null
select ' '


---this wont give any result because subquery does not return any row, hence exists return FALSE
select * from product
where EXISTS (
				select top 0 * from supplier
				)

---gives result because subquery return rows, hence subquery with exist return TRUE
select * from product
where EXISTS (
				select top 1 * from supplier
				)

--CORRELATED SUBQUERY using EXISTS
--select TOP 10 * from product
--select top 10 * from supplier

select * from supplier
where exists (
				select * 
				from product
				where supplier.SupplierID = product.SupplierID
					and product.Price > 90
				)

--SUBQUERY WITH HAVING
--select sum(Price)/20 from product
--where SupplierID = 1

select SupplierID,count(*) AS row_count--,avg(Price) as avg_price
from product
group by SupplierID
having AVG(Price) >= (
				select sum(Price)/50
				from product
				)
some
all
any

---TYPES OF SUBQUERIES
--single row sub query
--multiple row sub query
--multiple column sub query
--correlated sub query
--nested sub query

---SINGLE ROW SUB QUERY
--select * from product
--select * from supplier

--using sub query in SELECT statement
select SupplierName
		,City
		,(select avg(Price) from product) as avg_price
from supplier

--Multiple Column sub queries

select * from physician_speciality
select * from patient_treatment

select *
from patient_treatment
where (physician_id,event_name) in (
									select 
											physician_id
											,speciality
									from physician_speciality
									where physician_id in (1000,2000,3000)
									)

----nested subquery within the SELECT statement
select SupplierName
		,City
		,(
			select 
				round(avg_price,2) 
			from
				(select 
					avg(Price) as avg_price 
				from product
				)a 
			) as avg_price_1
from supplier