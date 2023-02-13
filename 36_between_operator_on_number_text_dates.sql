--[dbo].[ORDERS]
--[dbo].[product]

--The BETWEEN operator selects values within a given range
--The values can be numbers, text, or dates


--number
select * from product
where Price between 20 and 40

select * from product
where Price not between 20 and 40

--text
select * from product
where ProductName between 'Chang' and 'Ikura'
order by ProductName

select * from product
where ProductName not between 'Chang' and 'Ikura'
order by ProductName

--dates
select * from ORDERS
WHERE ORDER_DATE not between '2009-01-01' and '2012-01-01'