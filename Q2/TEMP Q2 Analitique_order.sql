-- ** Creer la table analitique pour la combinaison des deux chifres dans order **

use quotidienne

  DROP TABLE Q2_anal;
  CREATE TABLE Q2_anal (n1 char (1) NOT NULL, n2 char (1) NOT NULL, 
                        jp int NOT NULL,
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
         INSERT INTO Q2_anal(n1, n2, jp, fois, minim, maxim) VALUES (@n1, @n2, 
		                                         DATEDIFF (DAY, (SELECT TOP(1) Tirage FROM Q2 WHERE n1=@n1 and n2=@n2 order by Tirage DESC), GETDATE ()),
												 (SELECT COUNT (*) FROM Q2 WHERE n1=@n1 and n2=@n2),  
												 (SELECT MIN (dddd) FROM Q2_days WHERE dd=@n1 and ddd=@n2),
												 (SELECT MAX (dddd) FROM Q2_days WHERE dd=@n1 and ddd=@n2)
												 )
          SET @n2 = @n2+1
        END
  SET @n1 = @n1+1
   END;

 -------------------------------------------------------
  SELECT MAX (fois) as 'MAX', MIN(fois) as 'MIN' FROM Q2_anal 
  Select * FROM Q2_anal --WHERE jp>=maxim-20
  
  Order by jp DESC

  --SELECT SUM (fois) FROM Q2_anal 
