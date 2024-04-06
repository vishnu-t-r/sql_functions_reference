--Date and time data types 

--Available types
/*
Date
Datetime
Datetime2
datetimeoffset
smalldatetime
time
*/

declare @date date,
		@datetime datetime,
		@datetime2 datetime2,
		@datetimeoffset datetimeoffset,
		@smalldatetime smalldatetime,
		@time time;

set @date = getdate();
set @datetime = getdate();
set @datetime2 = getdate();
set @datetimeoffset = getdate();
set @smalldatetime = getdate();
set @time = getdate();


select @date as [date],
		@datetime as [datetime],
		@datetime2 as [datetime2],
		@datetimeoffset as [datetimeoffset],
		@smalldatetime as [smalldatetime],
		@time as [time];

/*
https://learn.microsoft.com/en-us/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver16#DateandTimeDataTypes
*/