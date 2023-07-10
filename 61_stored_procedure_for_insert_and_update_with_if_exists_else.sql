--select * from store_proc

--stored procedure to insert and update
--if the is is already peresnt update and if not insert new record

create procedure insert_update_sp(
@user_id int,
@first_name varchar(100),
@marks int
)as
begin 
	if exists (select 1 from store_proc where user_id = @user_id)
	begin
	update store_proc
	set first_name = @first_name,
	marks = @marks
	where user_id = @user_id
	print('table updated')
	end
	else
	begin
	insert into store_proc
	values(@first_name,@marks)
	print('table inserted')
	end
end

exec insert_update_sp 101,'hamilton',101;

select * from store_proc