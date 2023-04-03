-- ** Compt le temps passe du tirage **

USE quotidienne

DECLARE @Date1 DATE
DECLARE @Date2 DATE
DECLARE @n1 int
DECLARE @n2 int

  DROP TABLE IF EXISTS Q2_dif;
  CREATE TABLE Q2_dif (n1 int, n2 int, Tirage int)


SET @n1 = (SELECT TOP(1) dd FROM Q2_days)
SET @n2 = (SELECT TOP(1) ddd FROM Q2_days)   
SET @Date1 = GETDATE ()
SET @Date2 = (SELECT TOP(1) d FROM Q2_days)

  INSERT INTO Q2_dif VALUES (@n1, @n2, DATEDIFF (DAY, @Date2, @Date1))


   SELECT * FROM Q2_dif