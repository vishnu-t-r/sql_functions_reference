--SELECT * FROM SourceProducts
--SELECT * FROM TargetProducts
--https://www.sqlshack.com/understanding-the-sql-merge-statement/
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
	delete

-- Checking the actions by MERGE statement
OUTPUT $action, 
DELETED.ProductID AS TargetProductID, 
DELETED.ProductName AS TargetProductName, 
DELETED.Price AS TargetPrice, 
INSERTED.ProductID AS SourceProductID, 
INSERTED.ProductName AS SourceProductName, 
INSERTED.Price AS SourcePrice;

SELECT @@RowCount




