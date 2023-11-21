
 -- ** Afficher tous les tirages Q2 **

 USE quotidienne

 DECLARE @BEGINDATE DATE
 DECLARE @ENDDATE DATE
                                --YYYY-MM-DD
  SET @BEGINDATE = CONVERT(DATE, '2023-01-01')
  SET @ENDDATE =   CONVERT(DATE, '2023-12-31')


select * from quotidienne.dbo.Q2

 -- WHERE Tirage>=@BEGINDATE and Tirage<=@ENDDATE and n1=n2

--where n1=n2

--ORDER BY Tirage DESC  -- les plus recentes au debut
--ORDER BY Tirage ASC