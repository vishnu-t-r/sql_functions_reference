--Sample_Superstore

--select top 10 * from Sample_Superstore
--creating a temporary table to store the dynamic sql result
create table #temptable(
 Segment nvarchar(50)
 )


declare @customerid nvarchar(50) = 'DV-13045'

execute sp_executesql N'INSERT INTO #temptable
						SELECT DISTINCT Segment
						FROM Sample_Superstore
						WHERE Customer_ID = @customerid'
						,N'@customerid nvarchar(50)'
						,@customerid = @customerid


--query the dynamic sql result from the table created
select * from #temptable