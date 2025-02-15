--rank vs dense_rank vs row_number

use int_ques;

/*
CREATE TABLE CustomerRank (
    CustomerID INT PRIMARY KEY,
    City VARCHAR(50),
    TotalSpent INT
);

INSERT INTO CustomerRank (CustomerID, City, TotalSpent)
VALUES
    (1, 'New York', 500),
    (2, 'New York', 700),
    (3, 'New York', 700),
    (4, 'Los Angeles', 300),
    (5, 'Los Angeles', 300),
    (6, 'Los Angeles', 200);
*/


select * from customerrank;

--now rank totalspent
--using partition city
--using three ranking functions

select *,
rank() 
over(partition by city order by totalspent desc) 
as rank_fn,
dense_rank() 
over(partition by city order by totalspent desc) 
as dense_rank_fn,
row_number() 
over(partition by city order by totalspent desc) 
as row_num_fn
from customerrank;

--rank -> ranks are skipped 
--row_number -> continuous ranking
--dense_rank -> no rank skipped