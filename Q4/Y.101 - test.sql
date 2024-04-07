USE quotidienne4

DECLARE @n1 int
DECLARE @n2 int
DECLARE @n3 int
DECLARE @n4 int


SET @n1 = 8
SET @n2 = 4
SET @n3 = 5
SET @n4 = 1




                 
                 SELECT * FROM Q4_fois WHERE n1 in (@n1, @n2, @n3, @n4) 
                                       and (n2 in (@n1, @n2, @n3, @n4) and n2<>n1) 
                                       and (n3 in (@n1, @n2, @n3, @n4) and n3<>n1 and n3<>n2)
                                       and (n4 in (@n1, @n2, @n3, @n4) and n4<>n1 and n4<>n2 and n4<>n3) 

                