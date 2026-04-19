SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- СЕССИЯ 1 НАЧИНАЕМ ТРАНЗАКЦИЮ 
BEGIN;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- СЕССИЯ 2 НАЧИНАЕМ ТРАНЗАКЦИЮ 
BEGIN;

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';

COMMIT;

-- СЕССИЯ 1
-- На SERIALIZABLE уровень должен сохранить исходное значение!
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
-- После COMMIT видим актуальное значение
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- СЕССИЯ 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';