--create database functions;

use functions;

--ADD or SUBSTRACT DATE

--DATEADD Function

--SYNTAX --> DATEADD (datepart, number, date)

--POSIBLE DATEPARTS
/*
Year(yyyy, yy)
Quarter(qq, q)
Month(mm,m)
Dayofyear(dy,y)
Day(dd,d)
Week(wk,ww)
Weekday(dw,w)
Hour(hh)
Minute(mi,n)
Second(ss,s)
Millisecond(ms)
Microsecond(mcs)
Nanosecond(ns)
*/

--NUMBER
--It can be an integer value or an expression returning an int value to add to the datepart. 
--It can be a positive or negative value.

--DATE
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

--DATE Function

declare @adddatetime datetime;  
set @adddatetime = getdate()
   
select DATEADD(hour,23,@adddatetime);       
select DATEADD(minute,59,@adddatetime);     
select DATEADD(second,59,@adddatetime);     
select DATEADD(day,365,@adddatetime);       
select DATEADD(month,13,@adddatetime);       
select DATEADD(quarter,4,@adddatetime);     
select DATEADD(week,5,@adddatetime);        
select DATEADD(dayofyear,365,@adddatetime);  
select DATEADD(weekday,31,@adddatetime);  
  
  

--DATEDIFF Function

--Syntax:

--DATEDIFF ( datepart , startdate , enddate )


--Startdate and enddate can be in 
	--date
	--datetime
	--datetime2
	--datetimeoffset
	--smalldatatime
	--time 

select DATEDIFF(year,'2010-01-01','2035-01-01') as year_diff;


select DATEDIFF(HOUR,'07:00:00.000','23:00:00.000') AS TimeInHours
		, DATEDIFF(MINUTE,'07:00:00.000','23:30:00.000') AS TimeInMinutes

--start and end date can be any expression or sub-query which return arguments of the required datatype
--(date, datetime, datetime2, datetimeoffset, smalldatetime, time)

--DATEDIFF_BIG function

--return big int value from the specified data part

--int data type support only 4 bytes (32 bits ---> -2,147,483,647 to 2,147,483,647)
--big int data type support 8 bytes (64 bits --> -9,223,372,036,854,775,807 to 9,223,372,036,854,775,807)

select datediff(millisecond, getdate(), getdate()+20);
select datediff(microsecond, getdate(), getdate()+20);

select datediff_big(microsecond, getdate(), getdate()+20) as microsecond_diff;