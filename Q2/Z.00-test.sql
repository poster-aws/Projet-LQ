USE quotidienne;

WITH Last_Appearance AS (
    SELECT 
        num,
        MAX(Tirage) AS last_date
    FROM (
        SELECT n1 AS num, Tirage FROM Q2
        UNION ALL
        SELECT n2 AS num, Tirage FROM Q2
    ) AS combined
    GROUP BY num
)
SELECT 
    num,
    DATEDIFF(DAY, last_date, GETDATE()) AS days_since_last
FROM Last_Appearance
ORDER BY num;