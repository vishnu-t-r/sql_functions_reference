--rollup
--cube
--grouping sets 

with t1 as
(
select Ship_Mode,
Segment,
Category,
Sub_Category,
Quantity from Sample_Superstore--[dbo].[payment]
)

select Ship_Mode,
Segment,
Category,
Sub_Category,
sum(Quantity) as total_quant
from t1
group by 
--cube
cube (Ship_Mode,Segment,Category,Sub_Category)

--rollup
--rollup (Ship_Mode,Segment,Category,Sub_Category)

--grouping sets
/*
grouping sets ((Ship_Mode,Segment,Category,Sub_Category),
(Ship_Mode,Segment),
()
)
*/
