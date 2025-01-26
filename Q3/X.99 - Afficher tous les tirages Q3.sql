-- ** Afficher tous les tirages Q3 ** quotidienne3.dbo.Q3  **
-- CREATE TABLE Q3_fois (n1 int, n2 int, n3 int, fois int, dern date, cons varchar(5))
-- cons '1-2-3' '****'

 USE quotidienne3
    DECLARE @comb char(3)
    DECLARE @BEGINDATE DATE
    DECLARE @ENDDATE DATE
                                --yyyy-mm-dd
  SET @BEGINDATE = CONVERT(DATE, '2022-09-13')
  SET @ENDDATE =   CONVERT(DATE, '2021-02-15')
  
  SELECT @comb='352'

SELECT * FROM Q3
--SELECT * from Q3 where n1 = SUBSTRING(@comb, 1, 1) and n2 = SUBSTRING(@comb, 2, 1) and n3 = SUBSTRING(@comb, 3, 1)
/* SELECT * from Q3 WHERE n1 in (SUBSTRING(@comb, 1, 1), SUBSTRING(@comb, 2, 1), SUBSTRING(@comb, 3, 1)) 
                  and n2 in (SUBSTRING(@comb, 1, 1), SUBSTRING(@comb, 2, 1), SUBSTRING(@comb, 3, 1))
                  and n3 in (SUBSTRING(@comb, 1, 1), SUBSTRING(@comb, 2, 1), SUBSTRING(@comb, 3, 1))
                  and n2<>n1 and n3<>n1 and n3<>n2
*/
-- ********************************* Q3_fois *********************************

-- SELECT * FROM Q3_fois WHERE n1 = SUBSTRING(@comb, 1, 1) and n2 = SUBSTRING(@comb, 2, 1) and n3 = SUBSTRING(@comb, 3, 1)

 --SELECT TOP (10) * FROM Q3_fois --WHERE fois=8
 --ORDER BY dern ASC

/*
SELECT * from Q3_fois where fois>=11 and fois<=19 and dern>=@BEGINDATE and dern<=@ENDDATE 
and cons='1-2-3'
and (n1=4 or n2=4 or n3=4)
*/
/*
SELECT * from Q3_fois
WHERE n1 in (1,2,3) and n2 in (1,2,3) and n3 in (1,2,3) and cons='****'
*/
--SELECT * FROM Q3_fois-- WHERE n1=n2 and n2=n3

ORDER BY Tirage DESC  -- les plus recentes au debut 
--ORDER BY Tirage ASC --les plus ancien au debut