-- ** Creer la table analitique pour la combinaison des deux chifres dans order **

use quotidienne

  DROP TABLE if EXISTS new_temp;
  CREATE TABLE new_temp (n1 int, n2 int)

DECLARE @n1 int
DECLARE @n2 int
DECLARE @n3 int

SET @n1 = 1
SET @n3 = 2

  WHILE @n1<4
   BEGIN
       SET @n2 = @n3
	   WHILE @n2<5
	    BEGIN
         INSERT INTO new_temp (n1, n2) VALUES (@n1, @n2)
          SET @n2 = @n2+1
        END
  SET @n1 = @n1+1
  SET @n3 = @n3+1
   END;

 -------------------------------------------------------
  SELECT * FROM new_temp