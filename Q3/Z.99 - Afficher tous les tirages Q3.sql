 -- ** Afficher tous les tirages Q3 **

 USE quotidienne3
   DECLARE @comb char(3)
 --DECLARE @BEGINDATE DATE
 --DECLARE @ENDDATE DATE
   SET @comb=222
                                --yyyy-mm-dd
  --SET @BEGINDATE = CONVERT(DATE, '2022-09-13')
  --SET @ENDDATE = CONVERT(DATE, '2021-02-15')

select * from Q3
--SELECT * from Q3 where n1 = SUBSTRING(@comb, 1, 1) and n2 = SUBSTRING(@comb, 2, 1) and n3 = SUBSTRING(@comb, 3, 1)

--ORDER BY tirage DESC  -- les plus recentes au debut
--ORDER BY Tirage ASC 