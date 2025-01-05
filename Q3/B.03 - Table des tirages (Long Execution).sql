 USE quotidienne3

DECLARE @n1 int
DECLARE @n2 int
DECLARE @n3 int
DECLARE @count int

DROP TABLE IF EXISTS #Q3_temp
--DROP TABLE IF EXISTS Q3_result

CREATE TABLE #Q3_temp (Tirage DATE, n1 INT, n2 INT, n3 INT)
--CREATE TABLE Q3_result (n1 INT, n2 INT, n3 INT, count int, Tirage DATE, Previous DATE, cons varchar(5))
TRUNCATE TABLE Q3_result

INSERT INTO #Q3_temp
SELECT * FROM Q3 ORDER BY Tirage DESC

SET @n1 = (SELECT TOP(1) n1 FROM #Q3_temp ORDER BY Tirage DESC)
SET @n2 = (SELECT TOP(1) n2 FROM #Q3_temp ORDER BY Tirage DESC)
SET @n3 = (SELECT TOP(1) n3 FROM #Q3_temp ORDER BY Tirage DESC)
SET @count = (SELECT count(Tirage) FROM #Q3_temp)

-- ******************************************************************

WHILE @count<>0
 BEGIN

  INSERT INTO Q3_result
  SELECT @n1, @n2, @n3, count (Tirage), MAX(Tirage), (SELECT TOP 1 Tirage FROM (SELECT TOP 2 Tirage FROM #Q3_temp WHERE n1=@n1 and n2=@n2 and n3=@n3 ORDER BY Tirage DESC) as Previous ORDER BY Tirage ASC),
         CASE when @n1!=@n2 and @n1!=@n3 and @n2!=@n3 then '1-2-3'
                  when @n1=@n2 and @n1=@n3 and @n2=@n3 then '****'
         ELSE '' END 
  FROM #Q3_temp WHERE n1=@n1 and n2=@n2 and n3=@n3

   DELETE FROM #Q3_temp WHERE Tirage IN (SELECT TOP(1) Tirage FROM #Q3_temp ORDER BY Tirage DESC)

 SET @count=@count-1
 SET @n1 = (SELECT TOP(1) n1 FROM #Q3_temp ORDER BY Tirage DESC)
 SET @n2 = (SELECT TOP(1) n2 FROM #Q3_temp ORDER BY Tirage DESC)
 SET @n3 = (SELECT TOP(1) n3 FROM #Q3_temp ORDER BY Tirage DESC)

 end

PRINT '*******************************************************************'

SELECT * FROM Q3_result


-- SELECT TOP(100) * FROM Q3 ORDER BY Tirage DESC
-- PRINT @count
-- ORDER BY Tirage DESC  -- les plus recentes au debut 
-- ORDER BY Tirage ASC --les plus ancien au debut