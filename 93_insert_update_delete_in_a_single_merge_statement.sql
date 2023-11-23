use int_ques;

/*
CREATE TABLE SourceProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO
    
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300)
GO
    
CREATE TABLE TargetProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO
    
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Desk',180)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',50)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',300)
GO
  */  
    
SELECT * FROM SourceProducts
SELECT * FROM TargetProducts


--INSERT UPDATE AND DELETE IN A SINGLE STATEMENT

merge targetproducts as target
using sourceproducts as source
on target.productid = source.productid
--insert new records
--when not matched then
when not matched by target then
--when not matched by source then (will give error)
insert(productid, productname, price)
values(source.productid, source.productname, source.price)

--update target table
when matched then
update set 
target.productid = source.productid,
target.productname = source.productname,
target.price = source.price


--delete from target table
--when not matched (will give error)
when not matched by source then
delete;






/*
delete from TargetProducts
where productid in (3,4)
*/

/*
truncate table targetproducts
truncate table sourceproducts
*/

SELECT * FROM SourceProducts
SELECT * FROM TargetProducts


