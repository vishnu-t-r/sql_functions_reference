/*
use int_ques
go

--insert records using stored procedure
--store_proc table
create table store_proc(
user_id int identity(101,1) not null,
first_name varchar(100),
marks int
)


insert into store_proc(first_name,marks)
values('lewis',90),
('george',84),
('charles',77)

select * from store_proc

*/
create procedure insert_sp
(
	@first_name varchar(100),
	@marks int
	) as
begin
	insert into store_proc(first_name,marks)
	values(@first_name,@marks)
	print('new customer data inserted')
end

exec insert_sp 'toto',75

select * from store_proc


--stored procedure to update a table
create procedure update_sp(
@user_id int
)
as
begin
update store_proc
set marks = 100
where user_id = @user_id
end

exec update_sp 101

select * from store_proc