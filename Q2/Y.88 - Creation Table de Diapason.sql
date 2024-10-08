USE quotidienne

DECLARE @1 INT
DECLARE @2 INT
DECLARE @n1 INT
DECLARE @n2 INT
DECLARE @count_ INT
DECLARE @count INT
DECLARE @c INT

DROP TABLE IF EXISTS TEST1
DROP TABLE IF EXISTS TEST2
DROP TABLE IF EXISTS TEST3
DROP TABLE IF EXISTS Q2_TEST
DROP TABLE IF EXISTS C

CREATE TABLE TEST1 (n1 INT, n2 INT, Tirage DATE)
CREATE TABLE TEST2 (n1 INT, n2 INT, Tirage DATE)
CREATE TABLE TEST3 (c INT, n1 INT, n2 INT, Tirage DATE)
CREATE TABLE Q2_TEST (n1 INT, n2 INT, Tirage DATE)
CREATE TABLE C (c INT)

INSERT INTO Q2_TEST (n1, n2, Tirage) SELECT n1, n2, Tirage FROM Q2

SET @count_ = 1
  WHILE @count_ < 10
    BEGIN

TRUNCATE TABLE TEST1
TRUNCATE TABLE TEST2
TRUNCATE TABLE TEST3

SET @1 = (SELECT TOP(1) n1 FROM Q2_TEST ORDER BY Tirage DESC)
SET @2 = (SELECT TOP(1) n2 FROM Q2_TEST ORDER BY Tirage DESC)
DELETE TOP (1) FROM Q2_TEST WHERE Tirage IN (Select top (1) Tirage from Q2_TEST Order by Tirage DESC)
----------------------------------------------------------------------------------------------------------

SET @n1 = 0 

  WHILE @n1<10
    BEGIN
    SET @n2 = 0 
      WHILE @n2<10
        BEGIN
         INSERT INTO TEST1 VALUES (@n1, @n2, (SELECT TOP(1) Tirage FROM Q2_TEST WHERE n1=@n1 and n2=@n2 ORDER BY Tirage DESC))
      SET @n2 = @n2+1
      END
   SET @n1 = @n1+1
END;
-----------------------------------------------------------------------------------------------------------
SET @count = 1
  WHILE @count < 101
    BEGIN
     INSERT INTO TEST2 SELECT TOP (1) * FROM TEST1 Order by Tirage DESC
     DELETE TOP (1) FROM TEST1 WHERE Tirage IN (Select top (1) Tirage from TEST1 Order by Tirage DESC)
SET @count = @count+1
    END;

INSERT INTO TEST3 SELECT ROW_NUMBER() OVER(ORDER BY Tirage DESC) as ROW, n1, n2, Tirage FROM TEST2

INSERT INTO C SELECT c FROM TEST3 WHERE @1=n1 and @2=N2

  SET @count_ = @count_+1
  END;

SELECT * FROM C --ORDER BY Tirage DESC

SELECT AVG (c) FROM C

--PRINT @1
--PRINT @2