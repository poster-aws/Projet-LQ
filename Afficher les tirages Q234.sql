USE quotidienne
USE quotidienne3
USE quotidienne4

DECLARE @TOP int
SET @TOP=3000
SELECT TOP(@TOP) * FROM quotidienne.dbo.Q2 ORDER BY Tirage DESC
--SELECT TOP(@TOP) * FROM quotidienne3.dbo.Q3 ORDER BY Tirage DESC
--SELECT TOP(@TOP) * FROM quotidienne4.dbo.Q4 ORDER BY Tirage DESC
--SELECT TOP(@TOP) * FROM quotidienne3.dbo.Q3_result --ORDER BY Tirage DESC