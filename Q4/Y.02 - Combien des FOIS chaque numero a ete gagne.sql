Use quotidienne4

TRUNCATE TABLE Q4_fois
-- CREATE TABLE Q4_fois (n1 int, n2 int, n3 int, n4 int, fois int, tirage date, cons varchar(5)))

DECLARE @n1 int
DECLARE @n2 int
DECLARE @n3 int
DECLARE @n4 int


    SET @n1=0
    WHILE @n1<10
	BEGIN
	  SET @N2 = 0
	  WHILE @n2<10
	    BEGIN
		  SET @n3 = 0
          WHILE @n3 < 10
		    BEGIN
              SET @n4 = 0
			  WHILE @n4 < 10
			    BEGIN
				INSERT INTO Q4_fois
		        SELECT @n1, @n2, @n3, @n4, count (Tirage), MAX (Tirage),
				       CASE WHEN @n1!=@n2 and @n1!=@n3 and @n1!=@n4 and
					             @n2!=@n3 and @n2!=@n4 and
						         @n3!=@n4 THEN '1-2-3'	 
	                   ELSE '' END
		        FROM Q4 WHERE @n1=n1 and @n2=n2 and @n3=n3 and @n4=n4
			     SET @n4=@n4+1
				 END
		     SET @n3=@n3+1
			 END
		   SET @n2=@n2+1
		   END
		SET @n1=@n1+1
		END;

SELECT * from Q4_fois