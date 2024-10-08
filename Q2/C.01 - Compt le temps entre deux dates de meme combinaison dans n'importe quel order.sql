 -- ** Compt le temps entre deux dates de meme combinaison dans n'importe quel order **

USE quotidienne

DECLARE @Date1 DATE
DECLARE @Date2 DATE
DECLARE @row int
DECLARE @row1 int
DECLARE @row2 int
DECLARE @n1 int
DECLARE @n2 int

  DROP TABLE IF EXISTS Q2_numer;
  CREATE TABLE Q2_numer (number int, Tirage DATE, n1 char (1) NOT NULL, n2 char (1) NOT NULL)

  DROP TABLE IF EXISTS Q2_days;
  CREATE TABLE Q2_days (d DATE, dd int, ddd int, dddd int)

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
SET @n1 = 3
SET @n2 = 1

    INSERT INTO Q2_numer SELECT ROW_NUMBER() over (ORDER BY Tirage DESC) as n,
    * FROM Q2 WHERE (n1=@n1 and n2=@n2) or (n1=@n2 and n2=@n1)

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
SET @row = (SELECT COUNT (*) from Q2 where (n1=@n1 and n2=@n2) or (n1=@n2  and n2=@n1))
SET @row1 = 1
SET @row2 = 2

 WHILE @row2!=@row+1
  BEGIN

 SET @Date1 = (SELECT Tirage FROM Q2_numer WHERE number = @row1)
 SET @Date2 = (SELECT Tirage FROM Q2_numer WHERE number = @row2)
 SET @n1 = (SELECT n1 FROM Q2_numer WHERE number = @row1)
 SET @n2 = (SELECT n2 FROM Q2_numer WHERE number = @row1)
 
INSERT INTO Q2_days VALUES (@Date1, @n1, @n2, DATEDIFF (DAY, @Date2, @Date1))

 SET @row1 = @row1+1
 SET @row2 = @row2+1

 END  

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
SET @n1 = (SELECT TOP(1) dd FROM Q2_days ORDER BY d DESC)
SET @n2 = (SELECT TOP(1) ddd FROM Q2_days ORDER BY d DESC)
SET @Date2 = (SELECT TOP(1) d FROM Q2_days ORDER BY d DESC)

 INSERT INTO Q2_days VALUES (GETDATE (), @n1, @n2, DATEDIFF (DAY, @Date2, GETDATE ()))

  --SELECT * FROM Q2_numer
 SELECT * FROM Q2_days --WHERE dd=7 and ddd=3
 ORDER BY d DESC

 --SELECT TOP(1) d FROM Q2_days
 --SELECT TOP(1) dd FROM Q2_days
 --SELECT TOP(1) ddd FROM Q2_days
 
 --SELECT AVG (dddd) FROM (SELECT top(20) dddd FROM Q2_days) as rrrr
  
  --SELECT AVG (dddd) FROM Q2_days
  --SELECT MAX (dddd) FROM Q2_days
  -- SELECT MIN (dddd) FROM Q2_days