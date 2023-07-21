--percent_rank vs cume_dist

--table monthly_sales
/*
CREATE TABLE monthly_sales(id Int, 
    mname varchar(15), 
    sales INT, 
    )
INSERT INTO monthly_sales(id, mname, sales)
VALUES(1,'Jan',40),(2,'Feb',45),(3,'Mar',55),
      (4,'Apr',67),(5,'May',77),(6,'Jun',85),
      (7,'Jul',89),(8,'Aug',88),(9,'Sep',81),
      (10,'Oct',69),(11,'Nov',56),(12,'Dec',43)
*/

select * from monthly_sales

select id,mname,sales,
		round(percent_rank() over(order by sales asc)*100,2) as per_rank,
		round(cume_dist() over(order by sales asc)*100,2) as cum_dist
from monthly_sales

--jan is the month with the least sales
--july is the month which has the max sales so both percent rank and cume rank are 100


--march has per_rank of 27.27 which means march has a sales which is greater than 27.27 records (3/11)
--per_rank = (rank -1)/(count -1)
--cume_dist = rank/count