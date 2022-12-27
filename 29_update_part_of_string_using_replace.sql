--update part of a string in sql
--question?

--replace @demo woth @demo1

--table
--emp

/*
CREATE TABLE [dbo].[Emp](
	[EmployeeID] [smallint] NOT NULL,

	[Email] [nvarchar](50) NOT NULL
) 

INSERT INTO dbo.Emp(EmployeeID,Email) VALUES (1,'adam@demo.com');
INSERT INTO dbo.Emp(EmployeeID,Email) VALUES (2,'mike@demo.com');
INSERT INTO dbo.Emp(EmployeeID,Email) VALUES (3,'mila@demo.com'); 
INSERT INTO dbo.Emp(EmployeeID,Email) VALUES (4,'david@demo.com');
INSERT INTO dbo.Emp(EmployeeID,Email) VALUES (5,'tina@demo.com');

*/

--select * from emp

--query
--using replace
select *, replace(Email, '@demo','@demo1') as nw_mail
from emp;


--inside update statement and updating the parent table
update emp
set email = replace(email,'@demo1','@demo');

select * from emp

--using stuff
--stuff(string,start_position,length,new_string)
select *,
		stuff(email,6,4,'@demo1')
from emp