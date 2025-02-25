--Display all the tables from a database
--4 different methods

use sql_pro_test;

--Query 1
SELECT table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE table_type = 'BASE TABLE';

--Query 2
SELECT name
FROM sys.tables;

--Query 3
SELECT name
FROM sysobjects
WHERE xtype = 'U';

--Query 4
SELECT name
FROM sys.objects
WHERE type_desc = 'USER_TABLE';

