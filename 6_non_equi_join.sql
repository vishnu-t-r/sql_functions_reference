
--!= not equal to
--USING PARENT CHILD RELATIONSHIP
select * 
from non_equi_join_test a,non_equi_join_test b
where a.S_NO != b.S_NO

--USING JOIN CONDITON
select * 
from non_equi_join_test a
join 
non_equi_join_test b
on a.S_NO != b.S_NO



--> greater than
--USING PARENT CHILD RELATIONSHIP
select * 
from non_equi_join_test a,non_equi_join_test b
where a.S_NO > b.S_NO

--USING JOIN CONDITON
select * 
from non_equi_join_test a
join 
non_equi_join_test b
on a.S_NO > b.S_NO



--BETWEEN
--USING PARENT CHILD RELATIONSHIP
select * 
from non_equi_join_test a,non_equi_join_test b
where a.S_NO BETWEEN 10 AND 40
and b.S_NO BETWEEN 30 AND 60

--USING JOIN CONDITON
select * 
from non_equi_join_test a
join 
non_equi_join_test b
on a.S_NO BETWEEN 10 AND 40
and b.S_NO BETWEEN 30 AND 60
