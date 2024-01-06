select datefromparts([year],[month],[day]) as proper_date --in date data type
from
(
select parsename(replace(date_input,'/','.'),1) as [day],
		parsename(replace(date_input,'/','.'),2) as [month],
		concat('20',parsename(replace(date_input,'/','.'),3)) as [year]
from
(select '22/06/25' as date_input) a

) b
