USE quotidienne
USE quotidienne3
USE quotidienne4

  DECLARE @ADDDATE DATE
  DECLARE @comb2 char(2)
  DECLARE @comb3 char(3)
  DECLARE @comb4 char(4)

  DECLARE @n1 int
  DECLARE @n2 int
  DECLARE @n3 int
  DECLARE @count int
                              --YYYY-MM-DD
  SET @ADDDATE = CONVERT(DATE, '2024-10-31')
    SELECT @comb2='97'
   SELECT @comb3='335'
  SELECT @comb4='1952'

SET @n1 = SUBSTRING(@comb3, 1, 1)
SET @n2 = SUBSTRING(@comb3, 2, 1)
SET @n3 = SUBSTRING(@comb3, 3, 1)

--/*
INSERT INTO quotidienne.dbo.Q2  VALUES (@ADDDATE, SUBSTRING(@comb2, 1, 1), SUBSTRING(@comb2, 2, 1))
INSERT INTO quotidienne3.dbo.Q3 VALUES (@ADDDATE, SUBSTRING(@comb3, 1, 1), SUBSTRING(@comb3, 2, 1), SUBSTRING(@comb3, 3, 1))
INSERT INTO quotidienne4.dbo.Q4 VALUES (@ADDDATE, SUBSTRING(@comb4, 1, 1), SUBSTRING(@comb4, 2, 1), SUBSTRING(@comb4, 3, 1), SUBSTRING(@comb4, 4, 1))
--*/

--*****************Add to Q3_result****************
  INSERT INTO quotidienne3.dbo.Q3_result
  SELECT @n1, @n2, @n3, count (Tirage), MAX(Tirage), (SELECT TOP 1 Tirage FROM (SELECT TOP 2 Tirage FROM quotidienne3.dbo.Q3 WHERE n1=@n1 and n2=@n2 and n3=@n3 ORDER BY Tirage DESC) as Previous ORDER BY Tirage ASC),
         CASE when @n1!=@n2 and @n1!=@n3 and @n2!=@n3 then '1-2-3'
                  when @n1=@n2 and @n1=@n3 and @n2=@n3 then '****'
         ELSE '' END
  FROM quotidienne3.dbo.Q3 WHERE n1=@n1 and n2=@n2 and n3=@n3


PRINT '*******************************'
SELECT TOP(1) * FROM quotidienne.dbo.Q2 ORDER BY Tirage DESC
SELECT TOP(1) * FROM quotidienne3.dbo.Q3 ORDER BY Tirage DESC
SELECT TOP(1) * FROM quotidienne4.dbo.Q4 ORDER BY Tirage DESC
PRINT '*******************************'

SELECT TOP(1) * FROM quotidienne3.dbo.Q3_result ORDER BY Tirage DESC