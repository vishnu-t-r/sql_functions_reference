-- DISTINCT RECORDS NOT USING DISTINCT KEYWORD

use int_ques;

select * from Sales_order

--using distinct keyword
select distinct status
from Sales_order

--distinct records using group by keyword
select status, deal_size
from Sales_order
group by status, deal_size