USE quotidienne4

DECLARE @count int
DECLARE @n1 int
DECLARE @n2 int
DECLARE @n3 int
DECLARE @n4 int

DROP TABLE IF EXISTS Q4_fois1;
CREATE TABLE Q4_fois1 (n1 int, n2 int, n3 int, n4 int, fois int)

DROP TABLE IF EXISTS #Q4_temp;
CREATE TABLE #Q4_temp (n1 int, n2 int, n3 int, n4 int, N int)

--TRUNCATE TABLE #Q4_temp 

INSERT INTO Q4_fois1 (n1, n2, n3, n4, fois)
SELECT n1,n2,n3,n4,fois FROM Q4_fois WHERE cons = '1-2-3'

SET @n1 = (SELECT TOP(1) n1 FROM Q4_fois1)
SET @n2 = (SELECT TOP(1) n2 FROM Q4_fois1)
SET @n3 = (SELECT TOP(1) n3 FROM Q4_fois1)
SET @n4 = (SELECT TOP(1) n4 FROM Q4_fois1)
SET @count = (SELECT count(n1) FROM Q4_fois1)

WHILE @count<>0
 BEGIN

	INSERT INTO #Q4_temp Values (@n1, @n2, @n3, @n4, (SELECT count(n1) FROM Q4_fois1 WHERE fois=0 and n1 in (@n1, @n2, @n3, @n4) 
                                       and (n2 in (@n1, @n2, @n3, @n4) and n2<>n1) 
                                       and (n3 in (@n1, @n2, @n3, @n4) and n3<>n1 and n3<>n2)
                                       and (n4 in (@n1, @n2, @n3, @n4) and n4<>n1 and n4<>n2 and n4<>n3)))
  
    DELETE FROM Q4_fois1 WHERE n1 in (@n1, @n2, @n3, @n4) 
                                       and (n2 in (@n1, @n2, @n3, @n4) and n2<>n1) 
                                       and (n3 in (@n1, @n2, @n3, @n4) and n3<>n1 and n3<>n2)
                                       and (n4 in (@n1, @n2, @n3, @n4) and n4<>n1 and n4<>n2 and n4<>n3)

SET @count = (SELECT count(n1) FROM Q4_fois1)
SET @n1 = (SELECT TOP(1) n1 FROM Q4_fois1)
SET @n2 = (SELECT TOP(1) n2 FROM Q4_fois1)
SET @n3 = (SELECT TOP(1) n3 FROM Q4_fois1)
SET @n4 = (SELECT TOP(1) n4 FROM Q4_fois1)

 END

PRINT '++++++'
--Select * from Q4_fois1
Select * from #Q4_temp ORDER BY N 