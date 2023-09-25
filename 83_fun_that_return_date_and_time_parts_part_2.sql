
--Functions that return date and time parts
select 
--date_bucket(wk,1,@tdy)
datename(day,@tdy) dtnameday,
datename(month,@tdy) dtnamemonth,
datename(year,@tdy) dtnameyear,
datepart(day,@tdy) dtpartday,
datepart(month,@tdy) dtpartmonth,
datepart(year,@tdy) dtpartyear,
--datetrunc(day,@tdy)
day(@tdy) as dy,
month(@tdy) as mth,
year(@tdy) as yr