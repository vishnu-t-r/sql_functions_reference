--FOR JSON

--FOR JSON AUTO
use [AdventureWorks_db];

select top 2 
BusinessEntityID,
PersonType,
FirstName,
LastName,
EmailPromotion,
ModifiedDate
from [Person].[Person]
for json auto

--add a new column in the [Person].[Person] table to add the new json value

alter table [Person].[Person]
add details_json nvarchar(max);

update [Person].[Person]
set details_json = (select 
						BusinessEntityID,
						PersonType,
						FirstName,
						LastName,
						EmailPromotion,
						ModifiedDate
						from [Person].[Person] table1
						where table1.BusinessEntityID = [Person].[Person].BusinessEntityID
						for json auto)

--select top 10 * from [Person].[Person]

--FOR JSON PATH

select top 1
BusinessEntityID,
PersonType,
FirstName as [name.firstname],
LastName as [name.lastname],
EmailPromotion,
ModifiedDate
from [Person].[Person]
for json path

--JSON PATH output
[{"BusinessEntityID":1,
"PersonType":"EM",
"name":{"firstname":"Ken","lastname":"Sánchez"},
"EmailPromotion":0,
"ModifiedDate":"2009-01-07T00:00:00"}]

--JSON AUTO output
[{"BusinessEntityID":1,
"PersonType":"EM",
"name.firstname":"Ken",
"name.lastname":"Sánchez",
"EmailPromotion":0,
"ModifiedDate":"2009-01-07T00:00:00"}]

--difference between json auto and json path
--https://stackoverflow.com/questions/52284555/for-json-path-vs-for-json-auto-sql-server

--additional column in the [Person].[Person] table for details_json_path result

alter table [Person].[Person]
add details_json_path nvarchar(max);

update [Person].[Person]
set details_json_path = (select 
		BusinessEntityID,
		PersonType,
		FirstName as [name.firstname],
		LastName as [name.lastname],
		EmailPromotion,
		ModifiedDate
		from [Person].[Person] table1
		where table1.BusinessEntityID = [Person].[Person].BusinessEntityID
		for json path
		)

select top 10 details_json, details_json_path
from [Person].[Person]