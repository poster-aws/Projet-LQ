-- ** Ajouter/supprimer/modifier un jour de tirage a Q3 **

USE quotidienne3

 DECLARE @ADDDATE DATE
 DECLARE @comb char(3)
                              --YYYY-MM-DD
  SET @ADDDATE = CONVERT(DATE, '2023-04-23')
  set @comb=270

 INSERT INTO Q3 VALUES (@ADDDATE, SUBSTRING(@comb, 1, 1), SUBSTRING(@comb, 2, 1), SUBSTRING(@comb, 3, 1))

 --DELETE FROM Q3 WHERE Tirage = @ADDDATE --and n1=SUBSTRING(@comb, 1, 1) and n2=SUBSTRING(@comb, 2, 1) and n3=SUBSTRING(@comb, 3, 1)
--UPDATE Q3 SET n1=SUBSTRING(@comb, 1, 1), n2=SUBSTRING(@comb, 2, 1), n3=SUBSTRING(@comb, 3, 1) where Tirage = @ADDDATE