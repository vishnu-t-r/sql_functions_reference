--https://www.sqlshack.com/understanding-the-sql-merge-statement/
--insert, update, and delete target table based on source table
--using merge
SELECT * FROM SourceProducts
SELECT * FROM TargetProducts

use MergeDemo
go

merge into targetproducts as target
using sourceproducts as source
on target.productid = source.productid
--for insert
when not matched then
	insert(productid,productname,price)
	values(source.productid,source.productname,source.price)
--for update
when matched then
	update set 
		target.productname = source.productname,
		target.price = source.price
--for delete
when not matched by source then
	delete;

select * from targetproducts
select * from sourceproducts



