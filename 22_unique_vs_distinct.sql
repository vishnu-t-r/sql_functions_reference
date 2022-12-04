--find distinct and find unique

--cars table
create table cars(
id int,
brand varchar(256),
model varchar(256),
production_year int
)

--insert data into cars table
insert into cars(id,brand,model,production_year)
values(111,'audi','Q7',2011),
(112,'Ford','Kuga',2019),
(113,'Jeep','Cherokee',2012),
(114,'Jeep','Wrangler',2015),
(115,'Tesla','Model Y',2014),
(116,'Tesla','Model Y',2020)

drop table cars

select * from cars

--distinct

select distinct brand from cars
select distinct brand,model from cars

--unique
select brand,count(*) as brand_count from cars
group by brand
having count(*) = 1

select brand,model,count(*) as brand_count from cars
group by brand,model
having count(*) = 1
