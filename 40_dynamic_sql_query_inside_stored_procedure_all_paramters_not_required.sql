--method 2
--query is dynamic
--not necessary to give all filter values

--declare @sql nvarchar(200) = '''hello text''%'
--print(@sql)

--select top 2 * from Sample_Superstore
create procedure test
		 @customer nvarchar(200) = null
		 ,@segment nvarchar(200) = null
as
declare @customerFilter nvarchar(200)
declare @segmentFilter nvarchar(200)

set @customerFilter = case when @customer is null --or @customer = 0
						then '1 = 1'
						else 'Customer_ID ='''+ @customer+''''
						end 
set @segmentFilter = case when @segment is null --or @segment = 0
						then '1 = 1'
						else 'Segment ='''+@segment+''''
						end

declare @sql nvarchar(500)
set @sql = 'SELECT * FROM Sample_Superstore
			WHERE 1 = 1 AND ' + @customerFilter + 'AND ' + @segmentFilter + ''
print(@sql)
exec(@sql)


--executing the procedure
exec test
		--@customer = null ,
		@segment = 'Consumer'