--
-- ** Arrangement Q4 **
--

use quotidienne4

  DROP TABLE IF EXISTS Q4_tmp
  CREATE TABLE Q4_tmp ( Tirage DATE, n1 INT, n2 INT, n3 INT, n4 INT )

DECLARE @BEGINDATE DATE
DECLARE @ENDDATE DATE
                              --yyyy-mm-dd
SET @BEGINDATE = CONVERT(DATE, '1983-06-06') -- Debut
SET @ENDDATE =   CONVERT(DATE, '2023-01-05') --Aujourd'hui

  WHILE (@BEGINDATE != DATEADD(DAY, +1, @ENDDATE))
   BEGIN

     INSERT INTO Q4_tmp (Tirage, n1, n2, n3, n4)
     SELECT * FROM (Select * from Q4 Where Tirage = @BEGINDATE) as qq

    SET @BEGINDATE = DATEADD(DAY, +1, @BEGINDATE)
   END

   DROP TABLE Q4
   CREATE TABLE Q4 ( Tirage DATE, n1 INT, n2 INT, n3 INT, n4 INT )

   INSERT INTO Q4(Tirage, n1, n2, n3, n4)
   SELECT * FROM Q4_tmp
   DROP TABLE Q4_tmp
