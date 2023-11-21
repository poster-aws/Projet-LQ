 -- ** Copie Q2 --> Q2_copy **
--/*
USE quotidienne

DROP TABLE IF EXISTS Q2_copy
CREATE TABLE Q2_copy ( Tirage DATE, n1 INT, n2 INT )

INSERT INTO Q2_copy ( Tirage, n1, n2 ) 
SELECT * FROM Q2 
--*/

-- ** Copie Q2_copy --> Q2 **
/*
USE quotidienne

DROP TABLE IF EXISTS Q2;
CREATE TABLE Q2 ( Tirage DATE, n1 INT, n2 INT )

INSERT INTO Q2(Tirage, n1, n2) 
SELECT * FROM Q2_copy

*/

SELECT * FROM Q2_copy
ORDER BY tirage DESC