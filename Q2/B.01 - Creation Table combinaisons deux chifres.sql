-- ** Creer la table avec les combinaisons des deux chifres **
USE quotidienne

  DROP TABLE IF EXISTS Q2_comb;
  CREATE TABLE Q2_comb (n1 char (1) NOT NULL, n2 char (1) NOT NULL)

DECLARE @n1 char (2)
DECLARE @n2 char (2)

SET @n1 = 0 

  WHILE @n1<10
   BEGIN
       SET @n2 = 0 
	   WHILE @n2<10
	    BEGIN
         INSERT INTO Q2_comb(n1, n2) VALUES (@n1, @n2)
          SET @n2 = @n2+1
        END
  SET @n1 = @n1+1
   END; 
------------ Dans n'emport quel order ----------------
SET @n1 = 0
 
   WHILE @n1<10
    BEGIN
	    SET @n2 = 0
		WHILE @n2<10
		 BEGIN
		  DELETE FROM Q2_comb 
		  WHERE n1!=@n1 and n2!=@n2 and n2<n1

		 SET @n2 = @n2 + 1
		 END
		 
	SET @n1 = @n1+1
	END;
 ------------------------------------------------------- 
  SELECT * FROM Q2_comb