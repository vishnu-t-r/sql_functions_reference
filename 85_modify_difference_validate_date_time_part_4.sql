--function that return date and time difference

select 
datediff(day,getdate(),datefromparts(2023,09,22)) as datedifffun, --return int
datediff_big(day,getdate(),datefromparts(2023,09,22)) as datediffbg --return big int

--function that modify date and time value

select 
dateadd(day,1,getdate()) as nextday,
eomonth(getdate()) as endofmonth

--function that validate date and time functions

select isdate(getdate()) as is_date
