USE quotidienne
USE quotidienne3
USE quotidienne4

DECLARE @TOP int
SET @TOP=500
SELECT TOP(@TOP) * FROM quotidienne.dbo.Q2 ORDER BY Tirage DESC
--SELECT TOP(@TOP) * FROM quotidienne3.dbo.Q3 ORDER BY Tirage DESC
--SELECT TOP(@TOP) * FROM quotidienne4.dbo.Q4 ORDER BY Tirage DESC
--SELECT TOP(@TOP) * FROM quotidienne3.dbo.Q3_result ORDER BY Tirage DESC

--SELECT * FROM quotidienne.dbo.Q2
--SELECT * FROM quotidienne3.dbo.Q3
--SELECT * FROM quotidienne4.dbo.Q4

--SELECT TOP(@TOP) * FROM Q2_anal WHERE jp<100 and jp>15 ORDER BY Tirage DESC