--identify reverse pairs in data

--table
--src_dest table

/*
create table src_dest(
source varchar(50),
destination varchar(50),
distance int
)

insert into src_dest(source,destination,distance)
values('Alaska','Albany',5166),
('Dover','Florida',1393),
('Illinois','Indiana',279),
('New Mexico','New York',2873),
('Albany','Alaska',5166),
('Ohio','Oklahoma',1383),
('Indiana','Illinois',279),
('Oklahoma','Ohio',1383),
('Frankfort','Georgia',695),
('Georgia','Frankfort',695)

*/

select * from src_dest

--method 1
--using self join and except
--case when you dont have to modify the base table

select * from src_dest
except
select s.*
from src_dest s
join src_dest d
on (s.source = d.destination
and s.destination = d.source
and s.source > s.destination)


--method 2

select distinct route_src_dest,distance
from
(
select case when source > destination then concat(source,'-',destination)
			when source < destination then concat(destination,'-',source)
			end as route_src_dest
			,distance
from src_dest
)a



--method 3 
--modify the base table (parent table)
select s.*
from src_dest s
join src_dest d
on (s.source = d.destination
and s.destination = d.source
and s.source > s.destination)

