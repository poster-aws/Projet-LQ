USE quotidienne4

DECLARE @n int
DECLARE @count int
DECLARE @p1 int
DECLARE @p2 int
DECLARE @p3 int
DECLARE @p4 int
DECLARE @c int

DROP TABLE IF EXISTS Q4_fois1;
CREATE TABLE Q4_fois1 (n1 int, n2 int, n3 int, n4 int)

DROP TABLE IF EXISTS Q4_result;
CREATE TABLE Q4_result (n1 int, n2 int, n3 int, n4 int, somme int)

INSERT INTO Q4_fois1 (n1, n2, n3, n4) 
SELECT n1, n2, n3, n4 FROM Q4_fois WHERE fois =0 
--and cons = ''
and cons = '1-2-3'

SET @count= (SELECT COUNT(*) FROM Q4_fois1)

SET @n=1
WHILE @n<@count
BEGIN
  SET @p1=(SELECT TOP(1) n1 FROM Q4_fois1)
  SET @p2=(SELECT TOP(1) n2 FROM Q4_fois1)
  SET @p3=(SELECT TOP(1) n3 FROM Q4_fois1)
  SET @p4=(SELECT TOP(1) n4 FROM Q4_fois1)
  SET @c=(SELECT COUNT(*) FROM Q4_fois1 WHERE n1 in (@p1, @p2, @p3, @p4) 
                                          and n2 in (@p1, @p2, @p3, @p4) 
                                          and n3 in (@p1, @p2, @p3, @p4) 
                                          and n4 in (@p1, @p2, @p3, @p4))

    DELETE FROM Q4_fois1 WHERE n1=@p1 and n2=@p2 and n3=@p3 and n4=@p4
      INSERT INTO Q4_result VALUES (@p1, @p2, @p3, @p4, @c)
        DELETE FROM Q4_fois1 WHERE n1 in (@p1, @p2, @p3, @p4) and n2 in (@p1, @p2, @p3, @p4) and n3 in (@p1, @p2, @p3, @p4) and n4 in (@p1, @p2, @p3, @p4)

SET @n=@n+1
END
DELETE FROM Q4_result WHERE somme=0

select * from Q4_result 
 -- WHERE (n1=4 or n2=4 or n3=4 or n4=4) --and n1<>3 and n2<>3 and n3<>3 and n4<>3

ORDER BY somme DESC

SELECT SUM (somme) from Q4_result