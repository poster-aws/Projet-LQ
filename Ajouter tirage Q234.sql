USE quotidienne
USE quotidienne3
USE quotidienne4

  DECLARE @ADDDATE DATE
  DECLARE @comb2 char(2)
  DECLARE @comb3 char(3)
  DECLARE @comb4 char(4)
                              --YYYY-MM-DD
  SET @ADDDATE = CONVERT(DATE, '2023-07-18')
    SELECT @comb2='55'
   SELECT @comb3='724'
  SELECT @comb4='7616'

--/*
INSERT INTO quotidienne.dbo.Q2  VALUES (@ADDDATE, SUBSTRING(@comb2, 1, 1), SUBSTRING(@comb2, 2, 1))
INSERT INTO quotidienne3.dbo.Q3 VALUES (@ADDDATE, SUBSTRING(@comb3, 1, 1), SUBSTRING(@comb3, 2, 1), SUBSTRING(@comb3, 3, 1))
INSERT INTO quotidienne4.dbo.Q4 VALUES (@ADDDATE, SUBSTRING(@comb4, 1, 1), SUBSTRING(@comb4, 2, 1), SUBSTRING(@comb4, 3, 1), SUBSTRING(@comb4, 4, 1))
--*/

SELECT TOP(1) * FROM quotidienne.dbo.Q2 ORDER BY Tirage DESC
SELECT TOP(1) * FROM quotidienne3.dbo.Q3 ORDER BY Tirage DESC
SELECT TOP(1) * FROM quotidienne4.dbo.Q4 ORDER BY Tirage DESC