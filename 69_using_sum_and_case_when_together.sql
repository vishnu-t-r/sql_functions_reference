--using sum and case when together
select * from sample_superstore

select distinct segment,
		--ship_mode,
		category
from sample_superstore

select distinct
		category
from sample_superstore

--total sales

select segment,
		round(sum(case when category = 'Office Supplies' then sales else 0 end),2) as cat_osupplies,
		round(sum(case when category = 'Furniture' then sales else 0 end),2) as cat_frnture,
		round(sum(case when category = 'Technology' then sales else 0 end),2) as cat_tech
from sample_superstore
group by segment



