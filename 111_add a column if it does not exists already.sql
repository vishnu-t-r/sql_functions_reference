-- Add a column if its does not already exists.

use int_ques;

select * from [dbo].[Sales_order]

--add a product_category column

--first check if the column already exists

if not exists(
select * from sys.columns
where [object_id] = (
					select [object_id] from sys.tables
					where name = 'Sales_order')
	and name = 'product_category'
)

begin

alter table [dbo].[Sales_order]
add product_category varchar(20) null;

end


alter table [dbo].[Sales_order]
drop column product_category;


/*
OBJECT_ID inbuilt function can be used to get the object id of table

if not exists(
select * from sys.columns
where [object_id] = OBJECT_ID(N'[dbo].[Sales_order]')
	and name = 'product_category'
)

begin

alter table [dbo].[Sales_order]
add product_category varchar(20) null;

end

*/