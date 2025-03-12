-- Создаем результирующую таблицу Q2_days1
USE quotidienne

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Q2_days1') AND type in (N'U'))
BEGIN
    CREATE TABLE Q2_days1 (
        Tirage DATE NOT NULL,
        n1 INT NOT NULL,
        n2 INT NOT NULL,
        days INT,
        PRIMARY KEY (Tirage, n1, n2)
    );
END

-- Вставляем данные в Q2_days1 с вычислением days
INSERT INTO Q2_days1 (Tirage, n1, n2, days)
SELECT 
    t1.Tirage,
    t1.n1,
    t1.n2,
    DATEDIFF(DAY, 
        (SELECT MAX(t2.Tirage) 
         FROM Q2 t2 
         WHERE t1.n1 = t2.n1 AND t1.n2 = t2.n2 AND t2.Tirage < t1.Tirage), 
        t1.Tirage
    ) AS days
FROM Q2 t1;


SELECT * FROM Q2_days1
ORDER BY n1,n2 ASC