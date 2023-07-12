--insert update and delete records in a table with stored procedure
--select * from store_proc

create procedure insert_update_delete_sp(
@user_id int,
@first_name varchar(100),
@marks int,
@action varchar(50)
)as
begin
	if @action = 'insert'
	begin
	insert into store_proc(first_name,marks)
	values(@first_name,@marks)
	print('new record inserted')
	end

	else if @action = 'update'
	begin
	update store_proc
	set 
	first_name = @first_name,
	marks = @marks
	where user_id = @user_id
	print('record updated')
	end

	else if @action = 'delete'
	begin
	delete from store_proc
	where user_id = @user_id
	print('record deleted')
	end
end

--drop procedure insert_update_delete_sp

--insert 
exec insert_update_delete_sp 104,'lando',98,'insert'
select * from store_proc

--update
exec insert_update_delete_sp 109,'oscar',92,'update'
select * from store_proc

--delete
exec insert_update_delete_sp 109,'oscar',98,'delete'
select * from store_proc