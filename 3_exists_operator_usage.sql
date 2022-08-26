/*
CREATE TABLE supplier(
	SupplierID	INTEGER NOT NULL,
	SupplierName VARCHAR(100),
	ContactName VARCHAR(100),
	Address VARCHAR(100),
	City VARCHAR(100),
	PostalCode VARCHAR(100),
	Country	VARCHAR(100),
	Phone VARCHAR(100),
	UNIQUE(SupplierID)
);
	
*/
/*
TRUNCATE TABLE supplier;
GO

-- import the file
BULK INSERT supplier --table to which we need to insert values
FROM 'C:\Users\91740\Downloads\supplier - Supplier.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO
*/
/*
CREATE TABLE product(
		ProductID INTEGER NOT NULL,
		ProductName	VARCHAR(100),
		SupplierID INTEGER NOT NULL,
		CategoryID INTEGER NOT NULL,
		Unit VARCHAR(100),
		Price FLOAT,
		UNIQUE(ProductID)
		);
*/

/*
TRUNCATE TABLE product;
GO

-- import the file
BULK INSERT product --table to which we need to insert values
--FROM 'C:\Users\91740\Downloads\product - Product.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO
*/

--select top 10 * from supplier
--select top 10 * from product

SELECT *--SupplierID,SupplierName
FROM supplier
WHERE 
	EXISTS (SELECT *--ProductName --CategoryID--
			FROM product 
			WHERE product.SupplierID = supplier.supplierID 
				AND 
				Price = 20);



