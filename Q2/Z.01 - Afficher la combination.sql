 -- ** Afficher la combination **

 USE quotidienne
 DECLARE @n1 char
 DECLARE @n2 char
 
 SET @n1 = 9 
 SET @n2 = 1
 
select TOP(20) * from quotidienne.dbo.q2
  where (n1=@n1 and n2=@n2) or (n1=@n2 and n2=@n1)

--ORDER BY Tirage ASC
ORDER BY Tirage DESC