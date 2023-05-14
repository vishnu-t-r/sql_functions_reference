--variance function
--var as a aggregate function

--select top 10 * from [dbo].[doctors]

--example1
select var(consultation_fee) as variance
from doctors

--example2
select var(all consultation_fee) as all_variance,
		var(distinct consultation_fee) as dist_variance
from doctors


--example3
--using var with over

select * from doctors

--order by specify the order in which the variance is calculated
--that can be specified based on the column in the use case 
select var(consultation_fee) over(order by id asc) as variance
from doctors

--example4
select city,var(consultation_fee) as variance
from doctors
group by city
