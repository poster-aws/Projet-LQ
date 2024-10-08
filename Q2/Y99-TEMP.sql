-- ** Creer la table analitique pour la combinaison des deux chifres dans order **

use quotidienne

  DROP TABLE Q2_anal;
  CREATE TABLE Q2_anal (n1 char (1) NOT NULL, n2 char (1) NOT NULL, 
                        jp int NOT NULL,
                        jp2 int NOT NULL,
						fois int,
						minim int,
						maxim int)

DECLARE @n1 char (2)
DECLARE @n2 char (2)

SET @n1 = 0 

  WHILE @n1<10
   BEGIN
       SET @n2 = 0 
	   WHILE @n2<10
	    BEGIN
         INSERT INTO Q2_anal(n1, n2, jp, jp2, fois, minim, maxim) 
                VALUES (@n1, @n2, 
		                 DATEDIFF (DAY, (SELECT TOP(1) Tirage FROM Q2 WHERE n1=@n1 and n2=@n2 order by Tirage DESC), GETDATE ()),
                         DATEDIFF (DAY, (SELECT TOP(1) Tirage FROM Q2 WHERE n1=@n1 and n2=@n2 order by Tirage DESC), 
                                        (SELECT TOP(1) Tirage FROM (SELECT TOP 2 Tirage FROM Q2 WHERE n1=@n1 and n2=@n2 ORDER BY Tirage DESC) as Previous ORDER BY Tirage ASC) ),
						 (SELECT COUNT (*) FROM Q2 WHERE n1=@n1 and n2=@n2),  
						 (SELECT MIN (dddd) FROM Q2_days WHERE dd=@n1 and ddd=@n2),
						 (SELECT MAX (dddd) FROM Q2_days WHERE dd=@n1 and ddd=@n2)
												 )
          SET @n2 = @n2+1
        END
  SET @n1 = @n1+1
   END;

 -------------------------------------------------------
  SELECT MAX (fois) as 'MAX fois', MIN(fois) as 'MIN fois' FROM Q2_anal 
  Select * FROM Q2_anal --WHERE n1=3 or n2=3--jp>=maxim-20
  
  Order by jp ASC  --DESC

  --SELECT SUM (fois) FROM Q2_anal 