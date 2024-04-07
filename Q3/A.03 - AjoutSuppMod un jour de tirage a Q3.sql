-- ** Ajouter/supprimer/modifier un jour de tirage a Q3 **

USE quotidienne3

 DECLARE @ADDDATE DATE
 DECLARE @ADDDATE2 DATE
 DECLARE @comb char(3)
                              --YYYY-MM-DD
  SET @ADDDATE = CONVERT(DATE, '2023-12-13')
  SET @ADDDATE2 = CONVERT(DATE, '2023-07-01')
  SELECT @comb = '086'

 --INSERT INTO Q3 VALUES (@ADDDATE, SUBSTRING(@comb, 1, 1), SUBSTRING(@comb, 2, 1), SUBSTRING(@comb, 3, 1))

 DELETE FROM Q3 WHERE Tirage = @ADDDATE and n1=SUBSTRING(@comb, 1, 1) and n2=SUBSTRING(@comb, 2, 1) and n3=SUBSTRING(@comb, 3, 1)
--UPDATE Q3 SET n1=SUBSTRING(@comb, 1, 1), n2=SUBSTRING(@comb, 2, 1), n3=SUBSTRING(@comb, 3, 1) where Tirage = @ADDDATE

--UPDATE Q3 SET Tirage = @ADDDATE WHERE  n1=4 and n2=3 and n3=9 and Tirage = @ADDDATE2


select * from quotidienne3.dbo.Q3
ORDER BY Tirage DESC  -- les plus recentes au debut

PRINT LEN(@comb)