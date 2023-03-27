--select top 10 * from [dbo].[Sample_Superstore]

--Customer_ID
--Segment


DECLARE @custid as varchar(max);

set @custid = ' ';

select @custid = @custid + Customer_ID
				+ char(10)
from Sample_Superstore
where Segment = 'Consumer'
order by Customer_ID

--select @custid as customer_id

PRINT(@custid)