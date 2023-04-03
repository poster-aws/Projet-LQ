USE quotidienne3
-- CREATE TABLE Q3_fois (n1 int, n2 int, n3 int, fois int, dern date, cons varchar(5))
-- cons '1-2-3' '****'

 DECLARE @BEGINDATE DATE
 DECLARE @ENDDATE DATE
                                --yyyy-mm-dd
 SET @BEGINDATE = CONVERT(DATE, '2019-01-01')
 SET @ENDDATE = CONVERT(DATE,   '2022-12-31')


SELECT * from Q3_fois where fois>=11 and fois<=19 and dern>=@BEGINDATE and dern<=@ENDDATE and cons='1-2-3'
and (n1=4 or n2=4 or n3=4)

--SELECT * from Q3_fois
--WHERE n1 in (1,2,3) and n2 in (1,2,3) and n3 in (1,2,3)-- and cons='****'

--ORDER BY fois ASC 