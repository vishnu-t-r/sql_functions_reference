select * from
openrowset(bulk 'C:\Users\91740\Desktop\SQL\sample_json_file_1.json', single_clob) as jsonfile;

declare @json nvarchar(max);

select @json = BulkColumn from
openrowset(bulk 'C:\Users\91740\Desktop\SQL\sample_json_file_1.json', single_clob) as jsonfile;
--set @json = openrowset(bulk 'C:\Users\91740\Desktop\SQL\sample_json_file_1.json', single_clob);

--print(@json)

declare @json_new nvarchar(max);

select @json_new = json_query(@json,'$."author info"');

print(@json_new);


select * from openjson(@json_new)
with(
id int '$.id',
auth_name varchar(25) '$.authorname',
age int '$.age',
skillset varchar(55) '$.skillsets'
)
