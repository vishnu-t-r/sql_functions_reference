--select top 10 * from Sample_Superstore

--question
--search for records based on different columns?
--segment,customer_id,state,category
/*
create procedure search
		@segment nvarchar(200),
		@customer_id nvarchar(200),
		@state nvarchar(200),
		@category nvarchar(200)
as

declare @seg nvarchar(200) = @segment
declare @cust_id nvarchar(200) = @customer_id
declare @stt nvarchar(200) = @state
declare @cat nvarchar(200) = @category

declare @sql nvarchar(500) = 'SELECT * FROM 
								Sample_Superstore
								WHERE Segment = @seg
								AND Customer_ID = @cust_id
								AND State = @stt
								AND Category = @cat'
print(@sql)
print(@seg)
print(@segment)
print(@cust_id)
print(@customer_id)
print(@stt)
print(@state)


execute sp_executesql @sql,
						N'@seg nvarchar(200),@cust_id nvarchar(200),@stt nvarchar(200),@cat nvarchar(200)',
						@seg = @segment,
						@cust_id = @customer_id,
						@stt = @state,
						@cat = @category

*/
--drop procedure search
/*
exec search 
		@segment = 'Consumer',
		@customer_id = 'CG-12520',
		@state = 'Kentucky',
		@category = 'Furniture'

*/


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

--select top 2 * from Sample_Superstore
