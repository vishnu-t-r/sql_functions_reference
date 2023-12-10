use [AdventureWorks_db];

--ISJSON()

--table [Person].[Person]

select top 10 * from [Person].[Person]
--details_json column

select top 10 details_json, isjson(details_json) as [json_?]
from [Person].[Person]

-- JSON_VALUE

select details_json, json_value(details_json,'$[0].BusinessEntityID') as test
from [Person].[Person]

select details_json_path, json_value(details_json_path,'$[0].name.firstname') as firstname,
							json_value(details_json_path,'$[0].name.lastname') as lastname
from [Person].[Person]

-- JSON_QUERY

--extract an array or object

select details_json,
		details_json_path,
		json_query(details_json, '$[0]') as object_1,
		json_query(details_json_path, '$[0].name') as name_array,
		json_value(details_json_path, '$[0].name.firstname') as firstname
from [Person].[Person]