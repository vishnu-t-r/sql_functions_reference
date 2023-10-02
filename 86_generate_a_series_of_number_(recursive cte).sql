--GENERATE A SERIES OF NUMBERS

--implemnted using recursive cte

declare @num int = 365;

--select @num;

with t1 as
(
select @num as input, 1 as n
union all
select (input-1) as input, n+1 as n
from t1
where input > 1)
select * from t1
option (maxrecursion 400)


--optimized query
with t1 as
(
select 100 as input

union all

select (input-1) as input
from t1
where input > 1
)
select * from t1
option (maxrecursion 100)