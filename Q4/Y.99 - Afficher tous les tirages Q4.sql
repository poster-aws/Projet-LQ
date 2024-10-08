 -- ** Afficher tous les tirages Q2 ** quotidienne4.dbo.Q4  **
--CREATE TABLE Q4_fois (n1 int, n2 int, n3 int, n4 int, fois int, tirage date, cons varchar(5))
-- cons '1-2-3' ''

 USE quotidienne4

 DECLARE @BEGINDATE DATE
 DECLARE @ENDDATE DATE
 DECLARE @comb char(4)

  SET @BEGINDATE = CONVERT(DATE, '2016-05-19')
  SET @ENDDATE = CONVERT(DATE, '2021-02-15')
 
  SELECT @comb='1356'

--SELECT * FROM Q4_fois
SELECT * FROM Q4 WHERE n1 = SUBSTRING(@comb, 1, 1) and n2 = SUBSTRING(@comb, 2, 1) and n3 = SUBSTRING(@comb, 3, 1) and n4 = SUBSTRING(@comb, 4, 1)

-- ********************************* Q3_fois *********************************

 --SELECT * from Q4_fois where n1 = SUBSTRING(@comb, 1, 1) and n2 = SUBSTRING(@comb, 2, 1) and n3 = SUBSTRING(@comb, 3, 1) and n4 = SUBSTRING(@comb, 4, 1)

--Tirage>=@BEGINDATE and Tirage<=@ENDDATE 

--SELECT * FROM Q4_fois --WHERE n1=n2 and n2=n3 and n3=n4

 /* SELECT * from Q4_fois WHERE n1 in (1,2,3,4) 
                       and (n2 in (1,2,3,4) and n2<>n1) 
                       and (n3 in (1,2,3,4) and n3<>n1 and n3<>n2)
                       and (n4 in (1,2,3,4) and n4<>n1 and n4<>n2 and n4<>n3) */
          

ORDER BY tirage DESC  -- les plus recentes au debut 
--ORDER BY Tirage ASC --les plus ancien au debut

--SELECT count (fois) as '1-2-3' from Q4_fois where fois=0 and cons='1-2-3'
--SELECT count (fois) from Q4_fois where fois=0 and cons=''