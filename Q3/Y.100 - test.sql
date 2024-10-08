USE quotidienne3

DECLARE @count int
DECLARE @n1 int
DECLARE @n2 int
DECLARE @n3 int

DROP TABLE IF EXISTS Q3_fois1;
CREATE TABLE Q3_fois1 (n1 int, n2 int, n3 int, fois int, der DATE)

DROP TABLE IF EXISTS Q3_result1;
CREATE TABLE Q3_result1 (n1 int, n2 int, n3 int, N int, D DATE)

INSERT INTO Q3_fois1 (n1, n2, n3, fois, der)
SELECT n1,n2,n3,fois,dern FROM Q3_fois WHERE cons = '1-2-3'

SET @n1 = (SELECT TOP(1) n1 FROM Q3_fois1)
SET @n2 = (SELECT TOP(1) n2 FROM Q3_fois1)
SET @n3 = (SELECT TOP(1) n3 FROM Q3_fois1)
SET @count = (SELECT count(n1) FROM Q3_fois1)

WHILE @count<>0
 BEGIN

	INSERT INTO Q3_result1 Values (@n1, @n2, @n3, (SELECT SUM(fois) FROM Q3_fois1 WHERE  n1 in (@n1, @n2, @n3) 
                                                                                     and n2 in (@n1, @n2, @n3) 
                                                                                     and n3 in (@n1, @n2, @n3)),
                                                    (SELECT TOP(1) der FROM Q3_fois1 WHERE  n1 in (@n1, @n2, @n3) 
                                                                                     and n2 in (@n1, @n2, @n3) 
                                                                                     and n3 in (@n1, @n2, @n3) ORDER BY der DESC))                                     
                                         
    DELETE FROM Q3_fois1 WHERE n1 in (@n1, @n2, @n3) and n2 in (@n1, @n2, @n3) and n3 in (@n1, @n2, @n3)

SET @count = (SELECT count(n1) FROM Q3_fois1)
SET @n1 = (SELECT TOP(1) n1 FROM Q3_fois1)
SET @n2 = (SELECT TOP(1) n2 FROM Q3_fois1)
SET @n3 = (SELECT TOP(1) n3 FROM Q3_fois1)

 END

PRINT '++++++'
Select * from Q3_result1 ORDER BY D DESC