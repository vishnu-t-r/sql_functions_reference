--ALTER TABLE Statement

--ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
	--also used to add and drop various constraints on an existing table.

--ADD Column
--DROP Column
--RENAME COLUMN
--MODIFY Datatype

create table transactions_table(
id int,
name char(100),
contact_no varchar(50),
created_at datetime
)

insert into transactions_table(id, name, contact_no, created_at)
values(1,'john','234765','2023-10-01'),
(2,'george','453678','2023-10-02'),
(3,'toto','768534','2023-10-03');

select * from transactions_table;

--ADD Column
--email column
ALTER TABLE transactions_table
ADD email varchar(50);

UPDATE transactions_table
SET email = CONCAT(contact_no,'@COMPANY.COM');


--DROP Column
--DELETING ID COLUMN

ALTER TABLE transactions_table
DROP COLUMN id;


--RENAME COLUMN
--created_at to transaction_at

ALTER TABLE transactions_table
RENAME COLUMN created_at TO transaction_at;


EXEC sp_rename 'transactions_table.created_at','transaction_at','COLUMN';


--MODIFY Datatype

--datetime to date
ALTER TABLE transactions_table
ALTER COLUMN transaction_at date;