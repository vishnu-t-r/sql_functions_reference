-- PASSING A VARIABLE AND DYNAMICALLY CHANGING THE DIMENSION FOR AGGREGATION

use questions;

--select * from Sample_Superstore

declare @dimension nvarchar(20) = 'segment'; -- 'category' (other dimesion)


with t1 as
(
select Sample_Superstore.*,
			(case when @dimension = 'segment' then Segment
				when @dimension = 'category' then Category
				end) as new_dim
from Sample_Superstore
)
select new_dim, sum(sales) as total_sales
from t1
group by new_dim;