--parse json with multiple cross apply
--convert json array and json object into rows
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
CarColorjson NVARCHAR(MAX) '$.color' AS JSON,
Carmodeljson NVARCHAR(MAX) '$.Model' AS JSON
) cross apply openjson(carcolorjson) with (
color varchar(25) '$')
cross apply openjson(carmodeljson) with (
carname varchar(25) '$.name',
fueltype varchar(25) '$."Fuel Type"',
transmission varchar(25) '$."TransmissionType"',
turbo varchar(25) '$."Turbo Charger"'
)
