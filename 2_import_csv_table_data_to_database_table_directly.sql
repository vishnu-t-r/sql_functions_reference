TRUNCATE TABLE table_name;
GO

-- import the file
BULK INSERT table_name --table to which we need to insert values
FROM 'C:\---location----\file_name.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO