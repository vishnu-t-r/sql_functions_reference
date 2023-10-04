--Convert string to date

--Four Methods 

--CAST()
--CONVERT()

--TRY_CAST()
--TRY_CONVERT()

--CAST()

select cast('12/12/2099' as date) as string_to_date_1,
		cast('2024/12/24' as datetime) as string_to_datetime_1,
		cast(getdate() as varchar(50)) as date_to_string

--CONVERT()

--syntax
--convert(data type, expression, style)

select convert(date, '01-01-2001', 103) as date_1,
		convert(datetime, '01-01-2001', 103) as datetime_1,
		convert(datetime, '01-01-2001', 102) as datetime_2,
		convert(date, '01-01-2001', 110) as date_3		


-- this will throw an error
-- we have to specify the style also, becuase the string format is not supported as of now
select convert(date, '14/12/2024') as date_1

select convert(date, '14/12/2024',104) as date_104
select convert(date, '14/12/2024',103) as date_103

--in this scenario the funvtion will act like a cast function
--even without style specified it will work, because this style is supported
select convert(date, '2024-1-12') as date_1



--main issue with data type conversion functions are they cannot handle error values

select cast('01/01/2000' as date) as dt1,
		cast('01/01/0000' as date) as dt2

--to handle this error when converting we use
--TRY_CAST and TRY_CONVERT
select try_cast('01/01/2000' as date) as dt1,
		try_cast('01/01/0000' as date) as dt2

--this will give an error becuase of the wrong input, ie. date which is not in range	
select convert(datetime, '01/01/0000', 103) as datetime_103

--corrected with try_convert
select try_convert(datetime, '01/01/0000', 103) as datetime_103


