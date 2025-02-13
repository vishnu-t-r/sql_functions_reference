--ROLLUP IN SQL

/*
SELECT column1, column2, ..., AGGREGATE_FUNCTION(column)
FROM table
GROUP BY ROLLUP(column1, column2, ...);
*/

--select * from cube_sales;

select product, region, sum(salesamount) as total_sales
from cube_sales
group by rollup(product, region);

--aggregate by product and region
--calculate sub-total by product
--grand total for all rows

select product, region, sum(salesamount) as total_sales
from cube_sales
group by rollup(region, product);

--aggregate by product and region
--calculate sub-total by region
--grand total for all rows

/*
Key Differences Between ROLLUP and CUBE:

ROLLUP:
Produces subtotals in a hierarchical manner (left-to-right in the GROUP BY list).
Generates fewer rows compared to CUBE.

CUBE:
Produces all possible combinations of groupings.
Includes subtotals for all possible subsets of columns.

*/