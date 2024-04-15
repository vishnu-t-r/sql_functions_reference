use int_ques;

--extract year and month from the date column without using date function

select * from [dbo].[amazon_shipment];

--YYYY-MM

select convert(varchar(7),shipment_date,120) as year_month_column
from amazon_shipment

--YYYY
select convert(varchar(4),shipment_date,120) as year_month_column
from amazon_shipment