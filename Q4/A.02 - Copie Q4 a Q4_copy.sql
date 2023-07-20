 -- ** Copie Q4 --> Q4_COPY **
--/*
USE quotidienne4

DROP TABLE IF EXISTS Q4_copy
CREATE TABLE Q4_copy ( Tirage DATE, n1 INT, n2 INT, n3 INT, n4 INT )

INSERT INTO Q4_copy ( Tirage, n1, n2, n3, n4 ) 
SELECT * FROM Q4
--*/

-- ** Copie Q4_COPY --> Q4 **
/*
USE quotidienne4

DROP TABLE IF EXISTS Q4;
CREATE TABLE Q4 ( Tirage DATE, n1 INT, n2 INT, n3 INT, n4 INT )

INSERT INTO Q4 ( Tirage, n1, n2, n3, n4 ) 
SELECT * FROM Q4_copy

*/

SELECT * FROM Q4_copy
ORDER BY Tirage DESC