 -- ** Copie Q3 --> Q3_COPY **
--/*
USE quotidienne3

DROP TABLE IF EXISTS Q3_copy
CREATE TABLE Q3_copy ( Tirage DATE, n1 INT, n2 INT, n3 INT)

INSERT INTO Q3_copy ( Tirage, n1, n2, n3) 
SELECT * FROM Q3
-- */
-- ** Copie Q3_COPY --> Q3 **
/*
USE quotidienne3

DROP TABLE IF EXISTS Q3;
CREATE TABLE Q3 ( Tirage DATE, n1 INT, n2 INT, n3 INT )

INSERT INTO Q3 ( Tirage, n1, n2, n3) 
SELECT * FROM Q3_copy
*/

SELECT * FROM Q3_copy
--ORDER BY tirage DESC