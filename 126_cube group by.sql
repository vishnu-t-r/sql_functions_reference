--CUBE IN SQL
--Generate all possible combinations of groupings for the result set
use int_ques;
/*
SELECT column1, column2, ..., AGGREGATE_FUNCTION(column)
FROM table
GROUP BY CUBE(column1, column2, ...);
*/

/*
use int_ques;

create table cube_sales(
product varchar(20),
region varchar(25),
salesamount int
);

insert into cube_sales(product, region, salesamount)
values('A',	'North',	100),
('A',	'South',	150),
('B',	'North',	200),
('B',	'South',	250)
*/

--We want to get the total sales for each product, region, and combinations of these?

--select * from cube_sales;


select product, region, sum(salesamount) as total_sales
from cube_sales
group by cube(product, region);