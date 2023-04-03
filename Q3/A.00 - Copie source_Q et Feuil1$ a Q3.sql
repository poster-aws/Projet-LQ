 /*  Copie Source_Q -> Q3  */
 --    !! ATTENTION !!  

USE quotidienne3

-- INSERT INTO Q3
-- SELECT Colonne_0, SUBSTRING(Colonne_2, 1, 1), SUBSTRING(Colonne_2, 2, 1), SUBSTRING(Colonne_2, 3, 1) FROM source_Q

INSERT INTO Q3(Tirage, n1, n2, n3) 
SELECT * FROM Feuil1$

SELECT * FROM quotidienne3.dbo.Q3