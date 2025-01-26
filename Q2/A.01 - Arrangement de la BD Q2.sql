-- ** Arrangement Q2 **
use quotidienne

  DROP TABLE IF EXISTS Q2_tmp
  CREATE TABLE Q2_tmp ( Tirage DATE, n1 INT, n2 INT )

DECLARE @BEGINDATE DATE
DECLARE @ENDDATE DATE
                              --AAAA-MM-JJ
SET @BEGINDATE = CONVERT(DATE, '2016-05-19') -- Debut pour Q2 2016-05-19
SET @ENDDATE =   CONVERT(DATE, '2025-01-30') -- Aujourd'hui +

  WHILE (@BEGINDATE != DATEADD(DAY, +1, @ENDDATE))
   BEGIN

     INSERT INTO Q2_tmp (Tirage, n1, n2)
     SELECT * FROM (Select * from Q2 Where Tirage = @BEGINDATE) as qq

    SET @BEGINDATE = DATEADD(DAY, +1, @BEGINDATE)
   END
  
   TRUNCATE TABLE Q2

   INSERT INTO Q2(Tirage, n1, n2) 
   SELECT * FROM Q2_tmp
   
   DROP TABLE Q2_tmp

   PRINT '************'
   SELECT TOP(1) * FROM Q2
   PRINT '************'
   PRINT '****Done****'