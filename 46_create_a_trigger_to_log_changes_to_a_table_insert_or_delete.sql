--create a trigger that automatically record the insert and delete on anothor table
--and save the records in a new audit table


--table used
--'Meals'
select * from [dbo].[Meals]

--step 1
--create an audit table to log the changes

create table meals_audit(
	MealName varchar(100)
	,updated_at datetime
	,operation char(3) check (operation = 'INS' or operation = 'DEL')
	)

--select * from meals_audit

--step2
--create a trigger to record the update and delete in the above table 'meals_audit'
--update and delete will happen on the 'meals' table
create trigger meals_audit_trigger
on meals
after insert,delete
as
begin
insert into meals_audit
		(MealName,updated_at,operation)
select MealName
		,GETDATE()
		,'INS'
from inserted

union all

select MealName
		,GETDATE()
		,'DEL'
from deleted;
end

--two virtual tables are used in the above query
--'deleted' and 'inserted' specifically available for trigger
--capture the data of the insereted/deleted/modified rows before and after the event occure


--step 3
--insert data into 'meals' table
insert into meals(MealName)
values('ice cream'),('bread')

--delete data from 'meals' table
delete from meals
where MealName = 'Omlet'


--step 4
--query the 'meals_audit' table
select * from meals_audit