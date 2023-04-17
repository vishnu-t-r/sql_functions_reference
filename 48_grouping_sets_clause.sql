--grouping sets clause
/*
CREATE TABLE payment (
	payment_amount decimal(8,2), 
	payment_date date, 
	store_id int);
*/
/*
INSERT INTO payment
VALUES
(1200.99, '2018-01-18', 1),
(189.23, '2018-02-15', 1),
(33.43, '2018-03-03', 3),
(7382.10, '2019-01-11', 2),
(382.92, '2019-02-18', 1),
(322.34, '2019-03-29', 2),
(2929.14, '2020-01-03', 2),
(499.02, '2020-02-19', 3),
(994.11, '2020-03-14', 1),
(394.93, '2021-01-22', 2),
(3332.23, '2021-02-23', 3),
(9499.49, '2021-03-10', 3),
(3002.43, '2018-02-25', 2),
(100.99, '2019-03-07', 1),
(211.65, '2020-02-02', 1),
(500.73, '2021-01-06', 3);
*/

--select * from payment


select sum(payment_amount) as total_amount,
		year(payment_date) as year,
		store_id
from payment
group by 
		grouping sets (
			(year(payment_date),store_id),	
			(year(payment_date)),
			(store_id),
			()
		)
order by year,store_id