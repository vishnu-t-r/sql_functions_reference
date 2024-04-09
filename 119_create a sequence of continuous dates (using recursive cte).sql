--create a sequence of continuous dates
--using recursive cte

use int_ques;

declare @start_date date = (select min(start_date) from tasks);
declare @end_date date = (select max(end_date) from tasks);

with cte as
(
select cast(@start_date as date) as date_column
--from tasks
union all

select dateadd(day,1,date_column) as date_column
from cte
where date_column < @end_date
)

select * from cte;