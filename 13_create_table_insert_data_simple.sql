--create a table 'product_table'

CREATE TABLE product_table(
id int not null,
product_name varchar(255),
price int
)


INSERT INTO product_table(id,product_name,price)
VALUES(1,'CAR',200),
(2,'BIKES',100)


SELECT * FROM product_table;