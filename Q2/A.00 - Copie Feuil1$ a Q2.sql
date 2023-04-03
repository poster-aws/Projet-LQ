 -- ** Copie Feuil1$ -> Q2 **
 -- ** !! ATTENTION !! **

USE quotidienne

--DROP TABLE Q2
--CREATE TABLE Q2 (Tirage DATE, n1 INT, n2 INT);

INSERT INTO Q2(Tirage, n1, n2) 
SELECT * FROM Feuil1$

--DROP TABLE Feuil1$;