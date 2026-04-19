SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL  READ COMMITTED;

-- СЕССИЯ 1 НАЧИНАЕМ ТРАНЗАКЦИЮ 
BEGIN;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';


-- СЕССИЯ 2 НАЧИНАЕМ ТРАНЗАКЦИЮ 
BEGIN;

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- СЕССИЯ 1 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- СЕССИЯ 2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';