﻿USE quotidienne4
--CREATE TABLE Q4_fois (n1 int, n2 int, n3 int, n4 int, fois int, dern date, cons varchar(5))
-- cons '1-2-3' ''

DECLARE @comb char(4)

set @comb=4444

--SELECT * from Q4_fois where n1 = SUBSTRING(@comb, 1, 1) and n2 = SUBSTRING(@comb, 2, 1) and n3 = SUBSTRING(@comb, 3, 1) and n4 = SUBSTRING(@comb, 4, 1)

--SELECT * from Q4 where n1 = SUBSTRING(@comb, 1, 1) and n2 = SUBSTRING(@comb, 2, 1) and n3 = SUBSTRING(@comb, 3, 1) and n4 = SUBSTRING(@comb, 4, 1)

--SELECT * from Q4_fois WHERE n1 in (0,0,8,4) and n2 in (0,0,8,4) and n3 in (0,0,8,4) and n4 in (0,0,8,4)

--SELECT count (fois) from Q4_fois where fois=0 and cons='1-2-3'
--SELECT count (fois) from Q4_fois where fois=0 and cons=''

SELECT * from Q4_fois where n1=n2 and n1=n3 and n1=n4 --fois=0 --and 
--WHERE cons<>'1-2-3'

ORDER BY dern desc