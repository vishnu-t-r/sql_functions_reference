--Write a query to add 15 days to today’s date

select dateadd(day,15,getdate());

select getdate() as [getdate], SYSDATETIME() as [sysdatetime];

--Write a query to Subtract 2 days from a specified date (today)

select dateadd(day, -2, getdate());

--Modify the query to return only output as yyyy-mm-dd instead of yyyy-mm-dd hh:mm:ss.sss

select dateadd(day, -2, getdate()) as format_1,
		cast(dateadd(day, -2, getdate()) as date) as format2 ;

--Write a SQL query to return 20 years later from the specified date 2022-07-22 and return output in yyyy-mm-dd format.

select cast(dateadd(year,20,'2022-07-22') as date) as date_20;

--What will be the timestamp after 2 from the current date

select dateadd(hh,2,getdate()) as timestamp_2;

--Add 8999 years in the specified date 20240727

select dateadd(year,8999,'20240727');
--will cause an overflow (year out of range)

--Give an example of the DATEADD function using the RANK function

use AdventureWorks_db;

select top 10 * from [Purchasing].[PurchaseOrderDetail]--[Sales].[SalesOrderDetail]--[Sales].[Customer]


select PurchaseOrderID,
		PurchaseOrderDetailID,
		duedate,
		row_number() over(order by duedate) as fun,
		dateadd(day, row_number() over(order by duedate, PurchaseOrderDetailID),getdate()) as rw_num
from [Purchasing].[PurchaseOrderDetail]

--What is the return data type of DATEADD function

/*
The return value data type for this method is dynamic. 
The return type depends on the argument supplied for date. If the value for date is a string literal date, 
DATEADD returns a datetime value. If another valid input data type is supplied for date, DATEADD returns the same data type.
*/

--date as string
select dateadd(day,10,'2024-01-10') as date_string;

--dynamic return data type
--date argument is supplied as date data type hence return type is also date data type
select dateadd(day,10,cast(getdate() as date)) as date_date;