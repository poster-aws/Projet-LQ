-- ** Creer la table analitique pour la combinaison des deux chifres dans order **
/*
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
  SELECT * FROM new_temp   */

  use quotidienne

DECLARE @n1 int
DECLARE @n2 int
DECLARE @n3 int
DECLARE @n4 int

SET @n1 = 1
SET @n2 = 2

SET @n4 = 1

  WHILE @n4<>6
     BEGIN
      SET @n1=@n1
        BEGIN
          SET @n2=@n2   
	          BEGIN
              PRINT @n1 PRINT @n2 PRINT @n3
            END
          END      
    END
          SET @n1 = @n1+1
          SET @n2 = @n2+1
          SET @n4=@n4+1
  