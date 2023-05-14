--creating a counter for alooping statement
--running a query inside a loop

--example 1
declare @counter int;
set @counter = 1;

while @counter <= 4
begin
select @counter;
--SET @counter = @counter+1
set @counter += 1
end;


--example 2
select * from [dbo].[custorder]--[dbo].[Drinks]


declare @counter int = 1;
declare @orderid int = 1111;

while @counter < 3
begin
select * from custorder
where orderid = @orderid;
set @counter += 1;
set @orderid += 1111;
end;

