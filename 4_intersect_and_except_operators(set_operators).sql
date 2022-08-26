--SET OPERATORS
--except

select SupplierID from product
EXCEPT
--INTERSECT
--SupplierName,ContactName
select SupplierID from supplier
where Country = 'USA'


--intersect
select SupplierID from supplier
where Country = 'USA'
INTERSECT
select SupplierID from product

--SupplierName,ContactName


