 -- ** Afficher tous les tirages Q2 **
USE quotidienne

DECLARE @BEGINDATE DATE
DECLARE @ENDDATE DATE
                                --YYYY-MM-DD
SET @BEGINDATE = CONVERT(DATE, '2024-04-17')
SET @ENDDATE =   CONVERT(DATE, '2024-05-25')

--SELECT TOP(10) * FROM quotidienne.dbo.Q2
SELECT * FROM Q2
--SELECT COUNT(*) FROM Q2
--SELECT * FROM Feuil1$
--WHERE Tirage>=@BEGINDATE and Tirage<=@ENDDATE --and n1=n2
--where n1=1 and n2=3 or n1=2 and n2=9

ORDER BY Tirage DESC  -- les plus recentes au debut
--ORDER BY Tirage ASC