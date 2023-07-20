--
-- ** Arrangement Q2 **
--

use quotidienne

  DROP TABLE IF EXISTS Q2_tmp
  CREATE TABLE Q2_tmp ( Tirage DATE, n1 INT, n2 INT )

DECLARE @BEGINDATE DATE
DECLARE @ENDDATE DATE

SET @BEGINDATE = CONVERT(DATE, '2016-05-19') -- Debut
SET @ENDDATE =  CONVERT(DATE, '2023-07-12') --Aujourd'hui

  WHILE (@BEGINDATE != DATEADD(DAY, +1, @ENDDATE))
   BEGIN

     INSERT INTO Q2_tmp (Tirage, n1, n2)
     SELECT * FROM (Select * from Q2 Where Tirage = @BEGINDATE) as qq

    SET @BEGINDATE = DATEADD(DAY, +1, @BEGINDATE)
   END

   DROP TABLE Q2
   CREATE TABLE Q2 ( Tirage DATE, n1 INT, n2 INT )

   INSERT INTO Q2(Tirage, n1, n2) 
   SELECT * FROM Q2_tmp
   DROP TABLE Q2_tmp

   SELECT TOP(1) * FROM Q2