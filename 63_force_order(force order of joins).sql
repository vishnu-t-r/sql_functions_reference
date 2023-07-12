--force order
use questions
go

select top 10 * from [dbo].[CUSTOMERS]

select * from [dbo].[Emp]--[dbo].[Sample_Superstore]
--order by Row_ID asc

select * from CUSTOMERS c
join emp e
on c.id = (110+e.EmployeeID)
option (force order)
