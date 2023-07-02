
CREATE TABLE users(
id int not null primary key,
reg_date date,
users_name varchar(50)
)



insert into users(id,reg_date,users_name)
values(1,'01/25/2023','John'),
(2,'01/26/2023','Lewis'),
(3,'01/27/2023','George'),
(4,'01/28/2023','Charles'),
(5,'01/29/2023','James')

select * from users

--drop 

drop table users;

--truncate

truncate table users;

--delete

delete from users
where id in (1,2);

