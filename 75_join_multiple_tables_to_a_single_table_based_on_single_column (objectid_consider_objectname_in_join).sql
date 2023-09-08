/*
create table areas(
areaid int,
area varchar(50),
area_division varchar(50)
)

create table regions(
regionid int,
region varchar(50),
region_division varchar(50)
)

create table territories(
terrid int,
territory varchar(50),
territory_division varchar(50)
)

create table user_mapping(
users_name varchar(50),
objectid int,
objectname varchar(50)
)

*/

/*
insert into user_mapping(users_name, objectid, objectname)
values('hamilton','11','area'),
('russel','12','area'),
('lewis','13','area'),
('george','21','region'),
('toto','23','region'),
('wolff','22','region'),
('sainz','24','region'),
('charles','31','terr'),
('vettel','32','terr'),
('valterri','33','terr'),
('hamilton','22','region'),
('russel','24','region'),
('wolff','11','area'),
('sainz','33','terr'),
('charles','13','area'),
('vettel','22','region'),
('valterri','21','region')
*/

/*

insert into areas(areaid, area, area_division)
values('11','kannur','north_kerala'),
('12','kozhikode','north_kerala'),
('13','thrissur','south_kerala'),
('21','kottayam','south_kerala')

insert into regions(regionid, region, region_division)
values('21','taliparamba','north_kerala'),
('22','alakode','north_kerala'),
('33','pampady','south_kerala'),
('24','sreekandapuram','north_kerala')

insert into territories(terrid, territory, territory_division)
values('31','chemperi','north_kerala'),
('32','nedumkuzhy','south_kerala'),
('33','mukkam','north_kerala'),
('21','pooparambu','north_kerala')

*/


select * from user_mapping
select * from areas
select * from regions
select * from territories


--join the tables to create a new table where area, region and territory is present for all users
select *
from user_mapping um
left join areas a
on um.objectid = a.areaid
left join regions r
on um.objectid = r.regionid
left join territories t
on um.objectid = t.terrid

--issue is, check the result for george and valterri
--for eg. george as per mapping table has only region(objectname is region), 
--but result table has area and terr for george which is not correct

--similarly for valterri, has been assigned only region and terr, not area

--modified sql query

select *
from user_mapping um
left join areas a
on (case when um.objectname = 'area' then um.objectid else null end)
		= a.areaid
left join regions r
on (case when um.objectname = 'region' then um.objectid else null end)
		= r.regionid
left join territories t
on (case when um.objectname = 'terr' then um.objectid else null end) 
		= t.terrid
