--checking the sys.object system table and only run the print if if exists condition return true
--example 1
if exists
(
select * from sys.objects
where object_id = OBJECT_ID(N'dbo.cars')
--name = 'cars'
)
begin
	--BOTH WORKS
	print('cars table already present')
	--print 'cars table already present'
end;

--example 2
--drop a table if not present
if exists
(
select * from sys.objects
where name = 'qwerty'
)
begin
 drop table qwerty;
end;

select * from qwerty

create table qwerty(a int,b int,c int)



--'drop if exists' statement
--syntax
--drop object_type [ifexists] object_name

drop table if exists qwerty

--drop column if exists
alter table qwerty
	drop column if exists a
go

select * from qwerty