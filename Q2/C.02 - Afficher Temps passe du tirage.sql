-- ** Compt le temps passe du tirage **
USE quotidienne

DECLARE @n1 int
DECLARE @n2 int

SET @n1 = 3
SET @n2 = 1

SELECT TOP(1) n1, n2, DATEDIFF (DAY, (SELECT TOP(1) Tirage FROM Q2 WHERE n1=@n1 and n2=@n2 ORDER BY Tirage DESC), GETDATE ()) as 'Day pass'
FROM Q2 WHERE n1=@n1 and n2=@n2 ORDER BY Tirage DESC
----------------------------------------------------------Dernier tirage enregistre----------------------------------------------------------
SELECT TOP(1) n1, n2, DATEDIFF (DAY, (SELECT TOP(1) Tirage FROM Q2 ORDER BY Tirage DESC) , GETDATE ()) as 'Day pass' from Q2 ORDER BY Tirage DESC