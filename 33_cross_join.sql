--cross join
--join every record of a table with other table


/*
CREATE TABLE Meals(MealName VARCHAR(100))
CREATE TABLE Drinks(DrinkName VARCHAR(100))
INSERT INTO Drinks
VALUES('Orange Juice'), ('Tea'), ('Coffee')
INSERT INTO Meals
VALUES('Omlet'), ('Fried Egg'), ('Sausage')
*/
SELECT *
FROM Meals
SELECT *
FROM Drinks


--method 1
select * from
Meals
cross join
Drinks

--method 2
select *
from Meals,Drinks


select concat(MealName,'-',DrinkName) as Combo
from Meals,Drinks