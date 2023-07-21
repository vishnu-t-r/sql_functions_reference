--Checking Distinct Counts in the Table
select * from sample_superstore

--count distinct customer_id
select count(*) as total,
		count(distinct customer_id) as customer_count
from sample_superstore

select count(*) as total,
		count(distinct order_id) as order_count
from sample_superstore

--count distinct customer_id,order_id combinations
select count(*) as total_records,
		count(distinct customer_id+order_id) as count_cus_ord
from sample_superstore

--using concat
select count(*) as total_records,
		count(distinct concat(customer_id,order_id)) as count_cus_ord
from sample_superstore
