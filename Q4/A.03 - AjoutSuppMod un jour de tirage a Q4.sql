-- ** Ajouter/supprimer/modifier un jour de tirage a Q4 **

USE quotidienne4

 DECLARE @ADDDATE DATE
 DECLARE @comb char(4)

                              --YYYY-MM-DD
  SET @ADDDATE = CONVERT(DATE, '2023-03-18')
  set @comb=2251

 INSERT INTO Q4 VALUES (@ADDDATE, SUBSTRING(@comb, 1, 1), SUBSTRING(@comb, 2, 1), SUBSTRING(@comb, 3, 1), SUBSTRING(@comb, 4, 1))

 --DELETE FROM Q4 WHERE Tirage = @ADDDATE and n1=SUBSTRING(@comb, 1, 1) and n2=SUBSTRING(@comb, 2, 1) and n3=SUBSTRING(@comb, 3, 1) and n4=SUBSTRING(@comb, 4, 1)
 --UPDATE Q4 SET n1=SUBSTRING(@comb, 1, 1), n2=SUBSTRING(@comb, 2, 1), n3=SUBSTRING(@comb, 3, 1), n4=SUBSTRING(@comb, 4, 1) WHERE Tirage = @ADDDATE