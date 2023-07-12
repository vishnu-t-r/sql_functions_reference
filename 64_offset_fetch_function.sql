select * from orders

--offset (number) row/rows fetch next/first (number) row/rows only
--first and next can be used interchangeably
select * from ORDERS
order by id asc
offset 3 rows fetch next 2 rows only

select * from ORDERS
order by id asc
offset 3 rows fetch first 2 rows only

--offset is compulsary
select * from ORDERS
order by id asc
offset 3 rows
