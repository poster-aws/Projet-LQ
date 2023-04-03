USE quotidienne3
-- CREATE TABLE Q3_fois (n1 int, n2 int, n3 int, fois int, dern date, cons varchar(5))

DECLARE @n1 int
DECLARE @n2 int
DECLARE @n3 int

  TRUNCATE TABLE Q3_fois
 
SET @n1 = 0 
WHILE @n1<10
BEGIN
   SET @n2 = 0 
   WHILE @n2<10
   BEGIN
      SET @n3 = 0 
      WHILE @n3<10
      BEGIN
	  
	    INSERT INTO Q3_fois
		  SELECT @n1, @n2, @n3, count (Tirage), MAX (Tirage), 
             CASE when @n1!=@n2 and @n1!=@n3 and @n2!=@n3 then '1-2-3'
                  when @n1=@n2 and @n1=@n3 and @n2=@n3 then '****'
             ELSE '' END
      FROM Q3 WHERE @n1=n1 and @n2=n2 and @n3=n3
		 		           
		  SET @n3 = @n3+1
      END
		
      SET @n2 = @n2+1
   END
  
  SET @n1 = @n1+1
END;

SELECT * from Q3_fois --where cons = '' or cons = '****'