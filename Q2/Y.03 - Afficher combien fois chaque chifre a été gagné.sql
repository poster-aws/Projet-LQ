 -- ** Afficher combien fois chaque chifre a ete gagne **
 USE quotidienne

 CREATE TABLE #COUNT (Num INT, Count INT)
 DECLARE @BEGINDATE DATE
 DECLARE @ENDDATE DATE
 DECLARE @N INT
                                --YYYY-MM-DD
  SET @BEGINDATE = CONVERT(DATE, '2024-03-18')
  SET @ENDDATE =   CONVERT(DATE, '2024-05-30')
  SET @N = 0

WHILE @N<10
   BEGIN

  INSERT INTO #COUNT VALUES (@N, 
                         (SELECT COUNT (*) FROM Q2 
                          WHERE Tirage>=@BEGINDATE and Tirage<=@ENDDATE and n1=@N)+
                         (SELECT COUNT (*) FROM Q2 
                          WHERE Tirage>=@BEGINDATE and Tirage<=@ENDDATE and n2=@N))
  SET @N = @N+1
   END
SELECT * FROM #COUNT
DROP TABLE #COUNT