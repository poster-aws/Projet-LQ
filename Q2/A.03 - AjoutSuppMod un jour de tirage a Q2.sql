-- ** Ajouter/supprimer/modifier un jour de tirage a Q2 **

USE quotidienne

 DECLARE @ADDDATE DATE
 DECLARE @ADDDATE2 DATE
 DECLARE @comb varchar(2)
                              --YYYY-MM-DD
 SET @ADDDATE = CONVERT(DATE, '2023-12-13')
 SELECT @comb = '55'
  
 SET @ADDDATE2 = CONVERT(DATE, '2023-07-01')
  
--INSERT INTO quotidienne.dbo.Q2 VALUES (@ADDDATE, SUBSTRING(@comb, 1, 1), SUBSTRING(@comb, 2, 1))

--DELETE FROM Q2 WHERE Tirage = @ADDDATE and n1=SUBSTRING(@comb, 1, 1) and n2=SUBSTRING(@comb, 2, 1)
--UPDATE Q2 SET n1=SUBSTRING(@comb, 1, 1), n2=SUBSTRING(@comb, 2, 1) WHERE Tirage = @ADDDATE

--UPDATE Q2 SET Tirage = @ADDDATE WHERE  n1=2 and n2=6 and Tirage = @ADDDATE2  

--select * from quotidienne.dbo.Q2

--WHERE Tirage>=@BEGINDATE and Tirage<=@ENDDATE and n1=n2

--ORDER BY Tirage ASC
--ORDER BY Tirage DESC  -- les plus recentes au debut