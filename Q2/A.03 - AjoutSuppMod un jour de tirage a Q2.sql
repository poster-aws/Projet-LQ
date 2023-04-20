-- ** Ajouter/supprimer/modifier un jour de tirage a Q2 **

USE quotidienne

 DECLARE @ADDDATE DATE
 DECLARE @comb char(2)
                              --YYYY-MM-DD
  SET @ADDDATE = CONVERT(DATE, '2023-04-19')
  SET @comb=61

INSERT INTO Q2 VALUES (@ADDDATE, SUBSTRING(@comb, 1, 1), SUBSTRING(@comb, 2, 1))

--DELETE FROM Q2 WHERE Tirage = @ADDDATE and n1=SUBSTRING(@comb, 1, 1) and n2=SUBSTRING(@comb, 2, 1)
--UPDATE Q2 SET n1=SUBSTRING(@comb, 1, 1), n2=SUBSTRING(@comb, 2, 1) WHERE Tirage = @ADDDATE