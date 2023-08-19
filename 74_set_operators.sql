--SET Operators

--Union
--Union all
--Except
--Intersect


--Union
(
    SELECT 1 ID
    UNION
    SELECT 2
    UNION
    SELECT 3
)
UNION
(
    SELECT 3 ID
    UNION
    SELECT 4
    UNION
    SELECT 5
);


--Union all
(
    SELECT 1 ID
    UNION
    SELECT 2
    UNION
    SELECT 3
)
UNION ALL
(
    SELECT 3
    UNION
    SELECT 4
    UNION
    SELECT 5
);

--Intersect
(
    SELECT 1 ID
    UNION
    SELECT 2
    UNION
    SELECT 3
)
INTERSECT
(
    SELECT 3
    UNION
    SELECT 4
    UNION
    SELECT 5
);

--Except
(
    SELECT 1 ID--[Non-Common from only A ]
    UNION
    SELECT 2
    UNION
    SELECT 3
)
EXCEPT
(
    SELECT 3 B
    UNION
    SELECT 4
    UNION
    SELECT 5
);