--table
--sales_data

/*
create table sales_data(
sales_year varchar(512),
sales_quarter varchar(512),
quantity int,
amount int)

insert into sales_data(sales_year,sales_quarter,quantity,amount)
values('2020','2020_q1',150,2300),
('2020','2020_q2',180,2700),
('2020','2020_q3',260,4100),
('2020','2020_q4',100,1700),
('2021','2021_q1',210,3600),
('2021','2021_q2',90,1600),
('2021','2021_q3',120,2200),
('2021','2021_q4',220,3800),
('2022','2022_q1',140,2200),
('2022','2022_q2',190,3400)

*/
--drop table sales_data

select * from sales_data

--total_sum
select sales_year
		,sum(quantity) as total_quantity
		,sum(amount) as total_sales_amount 
from sales_data
group by sales_year


--running sum
select sales_year,sum_qty,sum(sum_qty) over(order by sales_year asc) as run_sum_qty
		,sum_amt,sum(sum_amt) over(order by sales_year asc) as run_sum_amt
from (
select sales_year
	,sum(quantity) as sum_qty
	,sum(amount) as sum_amt
from sales_data
group by sales_year
) a


--simple sum question?
--write a query to first generate a new dataset grouped by sales_year with total amount and total quantity for that year?
--The result set contain three columns, namely:
	--1) sales_year
	--2) tot_qty (total_quantity)
	--3) tot_amount (total_amount)


--running total question?
--compute a running total of quantity and amount by sales_year, ordered by sales_year .
--The result set, should contain three columns, namely:
	--1) sales_year
	--2) cum_qty (cumulative_quantity)
	--3) cum_amount (cumulative_amount)