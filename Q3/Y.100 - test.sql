USE quotidienne3

DECLARE @count int
DECLARE @n1 int
DECLARE @n2 int
DECLARE @n3 int
DECLARE @n4 int

DROP TABLE IF EXISTS Q3_fois1;
CREATE TABLE Q3_fois1 (n1 int, n2 int, n3 int, fois int)

DROP TABLE IF EXISTS Q3_result;
CREATE TABLE Q3_result (n1 int, n2 int, n3 int, N int)

--TRUNCATE TABLE Q4_result 

INSERT INTO Q3_fois1 (n1, n2, n3, fois)
SELECT n1,n2,n3,fois FROM Q3_fois WHERE cons = '1-2-3'

SET @n1 = (SELECT TOP(1) n1 FROM Q3_fois1)
SET @n2 = (SELECT TOP(1) n2 FROM Q3_fois1)
SET @n3 = (SELECT TOP(1) n3 FROM Q3_fois1)
SET @count = (SELECT count(n1) FROM Q3_fois1)

Select * from Q3_fois1

WHILE @count<>0
 BEGIN

	INSERT INTO Q3_result Values (@n1, @n2, @n3, (SELECT count(n1) FROM Q3_fois1 WHERE fois<>0 and n1 in (@n1, @n2, @n3) 
                                       and (n2 in (@n1, @n2, @n3) and n2<>n1) 
                                       and (n3 in (@n1, @n2, @n3) and n3<>n1 and n3<>n2)))
                                         
    DELETE FROM Q3_fois1 WHERE n1 in (@n1, @n2, @n3) 
                                       and (n2 in (@n1, @n2, @n3) and n2<>n1) 
                                       and (n3 in (@n1, @n2, @n3) and n3<>n1 and n3<>n2)

SET @count = (SELECT count(n1) FROM Q3_fois1)
SET @n1 = (SELECT TOP(1) n1 FROM Q3_fois1)
SET @n2 = (SELECT TOP(1) n2 FROM Q3_fois1)
SET @n3 = (SELECT TOP(1) n3 FROM Q3_fois1)

 END

PRINT '++++++'
--Select * from Q4_fois1
Select * from Q3_result-- ORDER BY N 