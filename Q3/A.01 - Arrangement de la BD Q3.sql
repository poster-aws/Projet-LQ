/*  Arrangement Q3  */

use quotidienne3

  DROP TABLE IF EXISTS Q3_tmp
  CREATE TABLE Q3_tmp (Tirage DATE, n1 INT, n2 INT, n3 INT)

DECLARE @BEGINDATE DATE
DECLARE @ENDDATE DATE
                              --yyyy-mm-dd
SET @BEGINDATE = CONVERT(DATE, '1983-06-06') -- Debut
SET @ENDDATE =   CONVERT(DATE, '2023-12-31') --Aujourd'hui

  WHILE (@BEGINDATE != DATEADD(DAY, +1, @ENDDATE))
   BEGIN
     INSERT INTO Q3_tmp (Tirage, n1, n2, n3)
     SELECT * FROM (Select * from Q3 Where Tirage = @BEGINDATE) as qq

    SET @BEGINDATE = DATEADD(DAY, +1, @BEGINDATE)
   END

   DROP TABLE Q3
   CREATE TABLE Q3 ( Tirage DATE, n1 INT, n2 INT, n3 INT)

   INSERT INTO Q3(Tirage, n1, n2, n3)
   SELECT * FROM Q3_tmp
   
   DROP TABLE Q3_tmp

   PRINT '************'
   PRINT '****Done****'
   PRINT '************'