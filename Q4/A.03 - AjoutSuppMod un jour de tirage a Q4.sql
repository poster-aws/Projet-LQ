-- ** Ajouter/supprimer/modifier un jour de tirage a Q4 **

USE quotidienne4

 DECLARE @ADDDATE DATE
 DECLARE @ADDDATE2 DATE
 DECLARE @comb char(4)

                              --YYYY-MM-DD
  SET @ADDDATE = CONVERT(DATE, '2024-07-04')
  SET @ADDDATE2 = CONVERT(DATE, '2023-07-01')
  SELECT @comb = '0647'

 --INSERT INTO Q4 VALUES (@ADDDATE, SUBSTRING(@comb, 1, 1), SUBSTRING(@comb, 2, 1), SUBSTRING(@comb, 3, 1), SUBSTRING(@comb, 4, 1))

 --DELETE FROM Q4 WHERE Tirage = @ADDDATE and n1=SUBSTRING(@comb, 1, 1) and n2=SUBSTRING(@comb, 2, 1) and n3=SUBSTRING(@comb, 3, 1) and n4=SUBSTRING(@comb, 4, 1)
 UPDATE Q4 SET n1=SUBSTRING(@comb, 1, 1), n2=SUBSTRING(@comb, 2, 1), n3=SUBSTRING(@comb, 3, 1), n4=SUBSTRING(@comb, 4, 1) WHERE Tirage = @ADDDATE

--UPDATE Q4 SET Tirage = @ADDDATE WHERE  n1=5 and n2=3 and n3=2 and n4=6 and Tirage = @ADDDATE2  

 select * from quotidienne4.dbo.Q4

ORDER BY Tirage DESC  -- les plus recentes au debut
--ORDER BY Tirage ASC

PRINT LEN(@comb)