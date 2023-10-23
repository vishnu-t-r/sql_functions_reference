-- application of cross apply

-- for the dept table, create a sub dept column for which value range from 1 to 4 for every dept

use int_ques;

--select * from dept

select deptid, subdeptid
from dept
cross apply
(values (1),(2),(3),(4)) columnnames(subdeptid)