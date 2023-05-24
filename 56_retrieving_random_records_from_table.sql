--Retrieving random data from SQL Server

	--TABLESAMPLE
	--NEWID()

--newid()
SELECT top 10  s.*,NEWID() AS NWID
FROM Sample_Superstore s
order by nwid

--tablesample()

SELECT * FROM Sample_Superstore TABLESAMPLE (10 PERCENT) REPEATABLE (123)
SELECT TOP 5 * FROM Sample_Superstore TABLESAMPLE (1000 ROWS);

/*
TABLESAMPLE ( { percentage PERCENT ) |
                num_rows ROWS 
                 } )
            [ REPEATABLE ( seed ) ]
*/


