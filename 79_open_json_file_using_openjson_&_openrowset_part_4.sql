--open json file using openrowset and openjson

--openrowset -> function used to resd file

--read json file with openrowset

declare @json nvarchar(max);

select @json = BulkColumn
from openrowset(bulk 'C:\Users\91740\Desktop\SQL\sample_json_file.json', single_clob) as jsonfile;

--using openjson to convert this into relational format

print(@json)

select * from openjson(@json)
with (
loginname varchar(25) '$.LoginName',
authtype varchar(25) '$.Authenticationtype',
rolesjson nvarchar(max) '$.Roles' as json
) cross apply openjson(rolesjson) with (
role varchar(25) '$'
)
