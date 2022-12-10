--[dbo].[supplier]
--SORTING
--desc city
select * from supplier
order by city asc--desc

select * from supplier
order by SupplierID desc

--filtering
--selecting the rows for which supplier is is even
select * from supplier
where SupplierID%2 = 0
ORDER BY supplierid desc

--country name starting with a
select * from supplier 
where country like 'f%'

--city name is paris
select * from supplier
where city in ('Paris','Tokyo','Osaka')

--exist
--not exist
--between
--all
--any

