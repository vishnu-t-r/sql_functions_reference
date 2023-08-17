--https://www.sqlshack.com/understanding-the-sql-merge-statement/
--create a new database
/*
CREATE DATABASE MergeDemo
GO

USE MergeDemo
GO
 
--create a source table 
CREATE TABLE SourceProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO

--insert data into source table    
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300)
GO
   
--create a target table   
CREATE TABLE TargetProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO

--insert data into target table    
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Desk',180)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',50)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',300)
GO
  
 */ 
    
SELECT * FROM SourceProducts
SELECT * FROM TargetProducts

--insert record from source table to target table

merge TargetProducts as target
using SourceProducts as source
on source.ProductID = target.ProductID
when not matched by target then
insert (productid,productname,price)
values(source.productid,source.productname,source.price);


delete from targetproducts
where productid in (3,4)

merge into targetproducts as target
using sourceproducts as source
on target.productid = source.productid
when not matched then
insert(productid,productname,price)
values(source.productid,source.productname,source.price);


select * from targetproducts;
