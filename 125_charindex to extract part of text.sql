--using CHARINDEX to extarct part of text

--CHARINDEX(character, expression)
--SUBSTRING(expression, string_start, length)

with t1 as(
select 'my trans  :John  am=80.00%https' as text,
charindex('=','my trans  :John  am=80.00%https') as ind_1,
	charindex('%','my trans  :John  am=80.00%https') as ind_2
)
select substring(text,ind_1+1,len(text)-ind_2) as amount
from t1