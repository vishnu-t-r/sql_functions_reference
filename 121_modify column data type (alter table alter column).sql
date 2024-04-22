--Why is it important to use the appropriate datatype in sql

--Change the data type of a column

--Data Integrity

--Storage Efficiency

--Query Performance

--Consistency and Standardization

--Compatibility and Interoperability


use int_ques;


create table datatypes(
order_date datetime,
order_id varchar(20)
);


insert into datatypes(order_date, order_id)
values('2015-10-01',1),
('2015-10-02',2),
('2015-10-03',3);

select * from datatypes;

alter table datatypes
alter column order_date date;

alter table datatypes
alter column order_id int;