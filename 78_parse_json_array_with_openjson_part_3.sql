--parse json arrays with openjson
--json arrays specified in [] and values are seperated in comma

declare @json nvarchar(max);

set @json ='{
    "LoginName" : "SystemLogin",
    "Authenticationtype" : "Windows",
    "Roles" : [ "bulkadmin", "setupadmin", "diskadmin" ]
	}'


--select * from openjson(@json)
--roles array will be in a single line

select * from openjson(@json)
with (
loginname varchar(25) '$.LoginName',
authtype varchar(25) '$.Authenticationtype',
roles varchar(25) '$.Roles'
)

--use the openjson again on roles column to convert it into multi-rows
select * from openjson(@json)
with (
loginname varchar(25) '$.LoginName',
authtype varchar(25) '$.Authenticationtype',
rolesjson nvarchar(max) '$.Roles' as json
) cross apply openjson(rolesjson) with (
rolename varchar(25) '$'
)

--using the json path parameter
declare @json nvarchar(max);

set @json ='{
    "LoginName" : "SystemLogin",
    "Authenticationtype" : "Windows",
    "Roles" : [ "bulkadmin", "setupadmin", "diskadmin" ]
	}'

select * from openjson(@json, '$.Roles')
with (
roles varchar(25) '$'
)