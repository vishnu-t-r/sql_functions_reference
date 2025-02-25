--pivot in sql

--Analyze sales per item per customer?

--given a sales_pivot_table
--with columns customer, item and sales

--generate an output where the result contain
--customer, each item has a seperate 
--column with correspinding sales

--create table
use int_ques;

CREATE TABLE SalesData_pivot (
    Customer VARCHAR(50),
    Item VARCHAR(50),
    Sales INT
);

--insert data
INSERT INTO SalesData_pivot (Customer, Item, Sales) VALUES 
('Alice', 'Laptop', 1200),
('Bob', 'Laptop', 1500),
('Alice', 'Phone', 800),
('Bob', 'Phone', 950),
('Alice', 'Tablet', 600),
('Bob', 'Tablet', 700);


--result query
select * from
(select customer, item, sales 
from SalesData_pivot)
as src
pivot(
sum(sales) for item in 
([Laptop], [Phone], [Tablet])) as pvt;




