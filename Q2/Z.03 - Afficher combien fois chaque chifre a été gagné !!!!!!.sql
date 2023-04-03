 -- ** Afficher combien fois chaque chifre a ete gagne **
 
 USE quotidienne

 DECLARE @BEGINDATE DATE
 DECLARE @ENDDATE DATE
 DECLARE @N INT
 
                                --YYYY-MM-DD
  SET @BEGINDATE = CONVERT(DATE, '2016-05-19')
  SET @ENDDATE =   CONVERT(DATE, '2023-02-28')
  SET @N = 0

while (@N!=10)
BEGIN

select @n as '*', ((SELECT COUNT (n1) 
                from quotidienne.dbo.q2
                 where Tirage>=@BEGINDATE 
                   and Tirage<=@ENDDATE 
	               and n1=@N )
			   
			   +(SELECT COUNT (n2)
			   from quotidienne.dbo.q2
             where Tirage>=@BEGINDATE 
               and Tirage<=@ENDDATE 
	           and n2=@N )
			   
			   ) as 'count'

SET @N = @N+1
END