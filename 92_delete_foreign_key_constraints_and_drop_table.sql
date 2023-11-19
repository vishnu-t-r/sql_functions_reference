--drop a table with foreign key constrains on it

--because it is not possible to delete a table with foreign key constraints
--so we have to delete the constraints before droping the table

drop table country;
drop table department;
drop table employee;
drop table folder;


--stored procedure to get all the foreign key constraints associated with a table
--EXEC sp_fkeys 'Tablename'

EXEC sp_fkeys 'country'
--country
	FK__DEPARTMEN__Count__267ABA7A

EXEC sp_fkeys 'department'
--department
	FK__EMPLOYEE__DeptId__29572725

--delete foreign key constrains from a table
ALTER TABLE DEPARTMENT
DROP CONSTRAINT FK__DEPARTMEN__Count__267ABA7A;


ALTER TABLE EMPLOYEE
DROP CONSTRAINT FK__EMPLOYEE__DeptId__29572725;