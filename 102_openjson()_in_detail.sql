declare @json_text nvarchar(max);

set @json_text = '

  {
    "websiteURL": "www.test.edu",
    "email": "hello@test.edu",
    "phone": 123456798,
    "address": {
        "address1": "1 Oak Grove",
        "address2": "London",
        "address3": "UK"
    },
    "accreditations": [
      {
        "name": "Indicator1",
        "value": "True"
      },
      {
        "name": "Indicator2",
        "value": "False"
      },
      {
        "name": "Indicator3",
        "value": "False"
      }
    ]
  }

'

--select @json_text;

		--select * from openjson(@json_text)

--DEFINING SCHEMA EXPLICITLY


/*select * from openjson(@json_text)
with ( websiteURL varchar(100),
		email varchar(100),
		phone int,
		address nvarchar(max) '$.address' as json,
		accreditations nvarchar(max) '$.accreditations' as json

)

--CROSS APPLY WITH OPENJSON()


select * from openjson(@json_text)
with ( websiteURL varchar(100),
		email varchar(100),
		phone int,
		address nvarchar(max) '$.address' as json,
		accreditations nvarchar(max) '$.accreditations' as json

)cross apply openjson(address) with
	(	address1 varchar(100),
		address2 varchar(100),
		address3 varchar(100)
		)
cross apply openjson(accreditations) with
	( name nvarchar(max) '$' as json)
cross apply openjson(name) with
	( name varchar(100),
		value varchar(100)
		)
*/

--CROSS APPLY AND SELECTING ONLY REQUIRED COLUMNS

select websiteURL,
		email,
		phone,
		address1,
		address2,
		address3,
		name,
		value
from openjson(@json_text)
with ( websiteURL varchar(100),
		email varchar(100),
		phone int,
		address nvarchar(max) '$.address' as json,
		accreditations nvarchar(max) '$.accreditations' as json

)cross apply openjson(address) with
	(	address1 varchar(100),
		address2 varchar(100),
		address3 varchar(100)
		)
cross apply openjson(accreditations) with
	( accreditation nvarchar(max) '$' as json)
cross apply openjson(accreditation) with
	( name varchar(100),
		value varchar(100)
		)
