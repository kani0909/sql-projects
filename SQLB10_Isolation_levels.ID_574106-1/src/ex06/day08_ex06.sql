SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL  REPEATABLE READ;

-- СЕССИЯ 1 НАЧИНАЕМ ТРАНЗАКЦИЮ 
BEGIN;

-- СЕССИЯ 2
BEGIN;

-- СЕССИЯ 1
SELECT SUM(rating) FROM pizzeria;

-- СЕССИЯ 2
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 1', 4);
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Kazan Pizza 1';

-- СЕССИЯ 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;

SELECT SUM(rating) FROM pizzeria;

-- СЕССИЯ 2
SELECT SUM(rating) FROM pizzeria;