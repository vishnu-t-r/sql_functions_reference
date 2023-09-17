--parse json in sql
--model is an object datatype in this representaion
--color is an array datatype

DECLARE @json NVarChar(2048) = N'{
    "owner": null,
  "brand": "BMW",
  "year": 2020,
   "status": false,
  "color": [ "red", "white", "yellow" ],
 
  
  "Model": {
    "name": "BMW M4",
    "Fuel Type": "Petrol",
    "TransmissionType": "Automatic",
    "Turbo Charger": "true",
    "Number of Cylinder": 4
 
  }
}';

select * from openjson(@json);
--key column (key name)
-- value column (value of the key)
--type is (data type in bumbers)
--0 null/ 1 string/ 2 int/ 3 bollean/	4 array/ 5 object


--using openjson with schema specified
--here we specify output column names and type

DECLARE @json1 NVarChar(2048) = N'{
"brand": "BMW",
"year": 2019,
"price": 1234.6,
"color": "red",
"owner": null
}'

select * from openjson(@json1)
with (
carbrand varchar(25) '$.brand',
mfgyear int '$.year',
price float '$.price',
color varchar(25) '$.color',
owner varchar(25) '$.owner'
)

--when object and array are present in the json text
--use 'AS JSON' to specify JSON object and arrays

declare @json nvarchar(2048) = N'{
    "owner": null,
  "brand": "BMW",
  "year": 2020,
   "status": false,
  "color": [ "red", "white", "yellow" ],
 
  
  "Model": {
    "name": "BMW M4",
    "Fuel Type": "Petrol",
    "TransmissionType": "Automatic",
    "Turbo Charger": "true",
    "Number of Cylinder": 4
 
  }
}';


select * from openjson(@json)
with (
CarOwner NVARCHAR(200) '$.owner',
CarBrand NVARCHAR(200) '$.brand',
CarModel INT '$.year',
CarPrice BIT '$.status',
CarColor NVARCHAR(MAX) '$.color' AS JSON,
CarColor NVARCHAR(MAX) '$.Model' AS JSON
)
