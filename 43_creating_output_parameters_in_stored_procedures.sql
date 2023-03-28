--select top 10 * from [dbo].[Sample_Superstore]


create procedure sp_output(
		@segment varchar(max),
		@rowcount int output
		)
as
begin
 select Category
		,Sub_Category
 from 
		Sample_Superstore
 where 
		Segment = @Segment;

 select @rowcount = @@ROWCOUNT

end


declare @count int
exec sp_output @segment = 'Consumer'
				,@rowcount = @count output

select @count as 'number of records'