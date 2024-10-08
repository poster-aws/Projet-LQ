-- ** Creer la table avec des combinaisons des deux chifres preindique sans doublons **
USE quotidienne

  DROP TABLE IF EXISTS Q2_comb;
  CREATE TABLE Q2_comb (n1 char (2) NOT NULL, n2 char (2) NOT NULL)

DECLARE @n1 char (1)
DECLARE @n2 char (1)
DECLARE @n3 char (1)
DECLARE @n4 char (1)
DECLARE @n5 char (1)

DECLARE @n_1 char (2)
DECLARE @n_2 char (2)

SET @n1 = 1
SET @n2 = 2
SET @n3 = 3
SET @n4 = 4
SET @n5 = 5

SET @n_1 = 0
WHILE @n_1<=9
BEGIN
  SET @n_2 = 0
  WHILE @n_2<=9
  BEGIN
    IF (@n_1 IN (@n1, @n2, @n3, @n4, @n5)) and (@n_2 IN (@n1, @n2, @n3, @n4, @n5)) and (@n_1!=@n_2)
	INSERT INTO Q2_comb (n1, n2) VALUES (@n_1, @n_2)
	SET @n_2 = @n_2+1
  END
SET @n_1 = @n_1+1
END

SET @n1 = 0
 
   WHILE @n1<9
    BEGIN
	    SET @n2 = 0
		WHILE @n2<9
		 BEGIN
		  DELETE FROM Q2_comb 
		  WHERE n1!=@n1 and n2!=@n2 and n2<n1
		SET @n2 = @n2 + 1
		 END	 
SET @n1 = @n1+1
	END

Select * FROM Q2_comb