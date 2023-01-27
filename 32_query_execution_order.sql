--query execution order
--from --> where --> group by --> having --> select --> order by --> limit (top)

--query writing order
--select --> top --> from --> where --> group by --> having --> order by

select * from [dbo].[brand_amount]




select --top 1 
		brand,
		sum(amount) as total_sales
from brand_amount
where brand like '%a%'
group by brand
having sum(amount) >= 60000
order by total_sales asc


--order of query execution and query writing order

select * from brand_amount

--? write a query to find the total sales achieved by each brand from the year 2017 to 2020
--? find the top 2 brands which are having a sum of amount > 80000

select top 2
	brand,
	sum(amount) as total_sales
from brand_amount
where year in (2017,2018,2019,2020) -- <> 2016
group by brand
having sum(amount) > 80000
order by total_sales desc

--query writing order
--select --> top -->from -->where -->group by -->having -->order by

--query execution order
--from (join) -->where -->group by -->having -->select -->order by -->top/limit