--convert integer to decimal

select 2/5

--cast function

cast(value/expression/column as decimal(p,s))

select cast(cast(2 as decimal(7,2))/cast(5 as decimal(7,2)) as decimal(4,2))

--convert function

convert(datatype , column/value/expression)

--7/3 into decimal

select convert(decimal(4,2),convert(decimal(4,2),7)/convert(decimal(4,2),3))

select 7/3