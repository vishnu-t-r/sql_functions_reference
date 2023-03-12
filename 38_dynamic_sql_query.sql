--dynamic sql query

--normal sql query
select * from CUSTOMERS
where NAME like 'R%'

--converting the above query into dynamic sql query
--method 1 using exec()
declare @var varchar(50) = 'B';

declare @sql varchar(500) = 'select * from CUSTOMERS
where NAME like ''' + @var + '%'''

print(@sql)

--execute the dynamic query
exec(@sql)


--method 2
--using inbuilt stored procedure 'sp_executesql'
declare @var varchar(20) = 'R%';

declare @sql nvarchar(200) = 'select * from CUSTOMERS
where NAME like @var'

execute sp_executesql @sql, N'@var varchar(20)', @var = @var


--using method 2 to collect the output to an output variable

declare @var1 nvarchar(20) = 'Ru%';
declare @Nme nvarchar(20)

declare @query nvarchar(200) = 'SELECT @Nme = NAME 
								FROM CUSTOMERS
								WHERE NAME like @var1'

execute sp_executesql @query, N'@var1 nvarchar(20), @Nme nvarchar(20) OUTPUT',@var1 = @var1,@Nme = @Nme OUTPUT

SELECT @Nme;

--sql injection disadvantage

--creating table sql_injection to demonstrate
/*
create table sql_injection(
test int
)

select * from sql_injection
*/

declare @var2 nvarchar(50) = '''R%''DROP TABLE sql_injection;'

--print(@var2)

declare @sql_q nvarchar(200) = 'SELECT * FROM CUSTOMERS WHERE NAME like'+ @var2

exec(@sql_q)

select * from sql_injection

--'sql_injection' table will be deleted because of the sql injection happened