 USE quotidienne3

  DECLARE @TOP INT

  SELECT @TOP=100

DROP TABLE IF EXISTS #fois
DROP TABLE IF EXISTS #dern
CREATE TABLE #fois (n1 int, n2 int, n3 int, fois int, dern DATE)
CREATE TABLE #dern (n1 int, n2 int, n3 int, fois int, dern DATE)

-- ********************************* Q3_fois *********************************

INSERT INTO #fois
SELECT TOP (@TOP) n1, n2, n3, fois, dern FROM Q3_fois
ORDER BY fois ASC

INSERT INTO #dern
SELECT TOP (@TOP) n1, n2, n3, fois, dern FROM Q3_fois
ORDER BY dern ASC

SELECT #fois.n1, #fois.n2, #fois.n3, #fois.fois, #fois.dern FROM #fois 
INNER JOIN #dern ON #fois.n1=#dern.n1 and #fois.n2=#dern.n2 and #fois.n3=#dern.n3
--ORDER BY #fois.fois ASC


--ORDER BY Tirage DESC  -- les plus recentes au debut 
--ORDER BY Tirage ASC --les plus ancien au debut