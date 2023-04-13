--create a dml trigger
--to automatically update a column by concatenating the firstname and lastname columns during the insert


--query 1
--create table studentss
create table studentss(
		id int primary key,
		firstname varchar(25),
		lastname varchar(25),
		fullname varchar(25)
		)

--query 2 
--create trigger
/*
create trigger fullname
after insert
on studentss
for each row
begin
 update studentss
	set fullname = concat(firstname,'-',lastname)
end
*/

create trigger fullname
on studentss
after insert
--for each row
as
begin
 update studentss
	set fullname = concat(firstname,'-',lastname)
end


--query 3
--inserting data into table
insert into studentss(id,firstname,lastname)
values(1,'lewsi','hamilton'),
(2,'george','russel')


--query 4
--select studentss records

select * from studentss


