-- constraints added when creating a table

-- create two tables with all the constraints

use int_ques;


create table parent_table(
parent_id int identity(1,1) primary key,
child_id int foreign key references child_table(child_id),
name varchar(100) not null,
address varchar(100) default 'default address',
age int check(age >  20),
number int,
constraint chck_address_number check(address = 'abcd' and number > 0)
)

create table child_table(
child_id int primary key,
name varchar(100) not null
)
