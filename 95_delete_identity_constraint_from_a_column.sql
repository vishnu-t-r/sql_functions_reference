--delete identity constrain from a column

--https://www.techbrothersit.com/2015/02/how-to-drop-identity-property-of-column.html

--table

use int_ques;

/*
create table value_table(
id int identity(1,1) primary key,
value_name varchar(100),
value_default varchar(50) default 'default_value'
)

insert into value_table(value_name)
values('name1')

insert into value_table(value_name,value_default)
values('name2','value1'),
('name2','value2')
*/


alter table value_table
add new_id int;

update value_table
set new_id = id;

alter table value_table
drop constraint PK__value_ta__3213E83F12702087;

alter table value_table
drop column id;

select * from value_table

-- rename the new_id column to id

EXEC sp_rename 'value_table.new_id', 'id', 'COLUMN';

select * from value_table;