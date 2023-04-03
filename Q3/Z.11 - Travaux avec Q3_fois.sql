USE quotidienne3
-- CREATE TABLE Q3_fois (n1 int, n2 int, n3 int, fois int, dern date, cons varchar(5))
-- cons '1-2-3' '****'

DECLARE @comb char(3)

set @comb=822

--SELECT * from Q3_fois where n1 = SUBSTRING(@comb, 1, 1) and n2 = SUBSTRING(@comb, 2, 1) and n3 = SUBSTRING(@comb, 3, 1)

SELECT * from Q3_fois where fois =8
--WHERE n1 in (1,2,3) and n2 in (1,2,3) and n3 in (1,2,3)-- and cons='****'

ORDER BY dern ASC  