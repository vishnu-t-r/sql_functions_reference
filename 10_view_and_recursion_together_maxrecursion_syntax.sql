CREATE VIEW dbo.V
AS
    WITH CTE AS
    (   SELECT 1 AS A 
        UNION ALL
        SELECT A + 1
        FROM    CTE
        WHERE   A < 50
    )
    SELECT  *
    FROM    CTE;
GO
SELECT  *
FROM    dbo.V
OPTION (MAXRECURSION 50);

--DROP VIEW V