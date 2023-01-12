--create table computer_store_1


--data collected by person 1
/*
create table computer_store_1(
product_id varchar(50),
product varchar(50),
brand varchar(50),
make_country varchar(50),
unit_price int,
model_year int)
*/
/*
insert into computer_store_1(product_id,product,brand,make_country,unit_price,model_year)
values('cp111','CPU','lenovo','india',1000,2020),
('mo222','Monitor','lg','korea',2000,2021),
('mo333','Monitor','sony','japan',2500,2021),
('ra444','RAM','intel','india',3000,2022),
('ra555','RAM','amd','usa',3200,2018),
('la666','Laptop','acer','usa',5500,2019),
('ma777','Macbook','apple','china',7500,2021),
('la888','Laptop','hp','india',4900,2020),
('mo999','Mouse','lenovo','korea',100,2022)
*/


--select * from computer_store_1

--data collected by 2nd person
/*
create table computer_store_2(
product_id varchar(50),
product varchar(50),
brand varchar(50),
make_country varchar(50),
unit_price int,
model_year int)


insert into computer_store_2(product_id,product,brand,make_country,unit_price,model_year)
values('cp111','CPU','lenovo','india',1000,2020),
('mo222','Monitor','lg','korea',2000,2021),
('mo333','Monitor','sony','japan',2500,2021),
('la112','laptop','samsung','korea',3000,2022),
('ta113','tablet','samsung','india',3000,2021),
('la114','laptop','dell','usa',4000,2022),
('de115','desktop','dell','usa',3700,2022)

*/

--select * from computer_store_1
--select * from computer_store_2

--appending with duplicates
select * from computer_store_1
union all
select * from computer_store_2


--appending without duplicates
select * from computer_store_1
union
select * from computer_store_2
