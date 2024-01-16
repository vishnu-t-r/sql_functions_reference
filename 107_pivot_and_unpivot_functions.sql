--Unpivot 

use questions;

/*
CREATE TABLE pivot_table (Vendor varchar(100), Emp1 INT, Emp2 INT,  
    Emp3 INT, Emp4 INT, Emp5 INT);  

GO  
INSERT INTO pivot_table VALUES ('vendor 1',4,3,5,4,4);  
INSERT INTO pivot_table VALUES ('vendor 2',4,1,5,5,5);  
INSERT INTO pivot_table VALUES ('vendor 3',4,3,5,4,4);  
INSERT INTO pivot_table VALUES ('vendor 4',4,2,5,5,4);  
INSERT INTO pivot_table VALUES ('vendor 5',5,1,5,5,5);  
GO  
*/


select * from pivot_table

-- Unpivot the table.  


select vendor, employee, orders
from
(
select Vendor, Emp1, Emp2, Emp3, Emp4, Emp5  
from pivot_table
) p
unpivot
(
Orders for employee in (Emp1, Emp2, Emp3, Emp4, Emp5)
) as unpvt_table

--column indentifiers are converted into row values
--and a new column to hold the values that currently exist under the column indentifers or column names

select vendor, employee, orders
into #temp_unpivot_table
from
(
select Vendor, Emp1, Emp2, Emp3, Emp4, Emp5  
from pivot_table
) p
unpivot
(
Orders for employee in (Emp1, Emp2, Emp3, Emp4, Emp5)
) as unpvt_table



select * from #temp_unpivot_table


--pivot this temp table into initial pivot_table


select vendor,[Emp1],[Emp2],[Emp3],[Emp4]
from
(select vendor, employee, orders from #temp_unpivot_table) as source_table
pivot
(max(orders) for employee in ([Emp1],[Emp2],[Emp3],[Emp4])) as pvt


