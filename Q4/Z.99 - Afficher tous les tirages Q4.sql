
 -- ** Afficher tous les tirages Q2 **

 USE quotidienne4

 --DECLARE @BEGINDATE DATE
 --DECLARE @ENDDATE DATE
 
  --SET @BEGINDATE = CONVERT(DATE, '2016-05-19')
  --SET @ENDDATE = CONVERT(DATE, '2021-02-15')


select * from quotidienne4.dbo.Q4
--select * from Q4_fois

  --where Tirage>=@BEGINDATE 
    --and Tirage<=@ENDDATE 
	--and n1=n2

--ORDER BY Tirage ASC
ORDER BY Tirage DESC  -- les plus recentes au debut 