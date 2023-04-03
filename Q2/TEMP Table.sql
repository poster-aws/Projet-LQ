 -- ** TEMP Table  **

USE quotidienne

DECLARE @Date1 DATE
DECLARE @Date2 DATE
DECLARE @Date3 DATE
DECLARE @row int
DECLARE @row1 int
DECLARE @row2 int
DECLARE @n1 int
DECLARE @nn1 int
DECLARE @n2 int
DECLARE @nn2 int

  DROP TABLE Q2_days;
  CREATE TABLE Q2_days (d DATE, dd int, ddd int, dddd int)

SET @n1 = 0

WHILE @n1!=10
BEGIN 
     SET @n2 = 0
     WHILE @n2!=10
	 BEGIN
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  DROP TABLE Q2_numer;
  CREATE TABLE Q2_numer (number int, Tirage DATE, n1 int, n2 int )

    INSERT INTO Q2_numer SELECT ROW_NUMBER() over (ORDER BY Tirage DESC) as qq,
    * FROM Q2 WHERE (n1=@n1 and n2=@n2) --or (n1=@n2 and n2=@n1)

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
SET @row = (SELECT COUNT (*) from Q2 where (n1=@n1 and n2=@n2)) --or (n1=@n2  and n2=@n1))
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
SET @Date3 = (SELECT TOP(1) Tirage FROM Q2_numer)
SET @nn1 = (SELECT TOP(1) n1 FROM Q2_numer)
SET @nn2 = (SELECT TOP(1) n2 FROM Q2_numer)

INSERT INTO Q2_days VALUES (GETDATE (), @nn1, @nn2, DATEDIFF (DAY, (SELECT TOP(1) Tirage FROM Q2_numer), GETDATE ()))

SET @n2 = @n2+1 
END
SET @n1 = @n1+1
END

 -- SELECT TOP(1) d FROM Q2_days where (dd=3 and ddd=0)
 --SELECT * FROM Q2_days  where (dd=3 and ddd=0) --or (dd=0 and ddd=3)
 --ORDER BY d DESC

 SELECT * FROM Q2_days
 --ORDER BY d DESC