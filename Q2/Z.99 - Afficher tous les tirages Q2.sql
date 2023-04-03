
 -- ** Afficher tous les tirages Q2 **

 USE quotidienne

 --DECLARE @BEGINDATE DATE
 --DECLARE @ENDDATE DATE
 
  --SET @BEGINDATE = CONVERT(DATE, '2016-05-19')
  --SET @ENDDATE = CONVERT(DATE, '2021-02-15')


select * from quotidienne.dbo.Q2
  --where Tirage>=@BEGINDATE 
    --and Tirage<=@ENDDATE 
	--and n1=n2

--ORDER BY Tirage ASC
ORDER BY Tirage DESC  -- les plus recentes au debut