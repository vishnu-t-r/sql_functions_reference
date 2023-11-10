-- Method to avoid SQL divide by zero error

use int_ques;

/*
create table sales_zero_error(
item varchar(100),
current_year_sales int,
previous_year_sales int
)

drop table sales_zero_error;

insert into sales_zero_error (item, current_year_sales, previous_year_sales)
values('pen',1000,800),
('pencil',1500,0),
('paper',800,900),
('book',1200,0)
*/

select * from sales_zero_error;

--Method 1
--using NULLIF function

--calculate the year over year sales growth for each item

select item,
		current_year_sales,
		previous_year_sales,
		((current_year_sales-previous_year_sales)/(previous_year_sales))*100 as growth_percent
from sales_zero_error

select item,
		current_year_sales,
		previous_year_sales,
		((current_year_sales-previous_year_sales)/nullif((previous_year_sales),0))*100 as growth_percent
from sales_zero_error


--Method 2
--using case


select item,
		current_year_sales,
		previous_year_sales,
		convert(int,((current_year_sales-previous_year_sales)/
		(case when previous_year_sales = 0 then null else previous_year_sales end))*100) as growth_percent
from sales_zero_error



/*
alter table sales_zero_error
alter column current_year_sales decimal(10,2);

alter table sales_zero_error
alter column previous_year_sales decimal(10,2);

*/