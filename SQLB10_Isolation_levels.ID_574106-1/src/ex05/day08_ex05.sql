SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL  READ COMMITTED;

-- СЕССИЯ 1 НАЧИНАЕМ ТРАНЗАКЦИЮ 
BEGIN;

-- СЕССИЯ 2
BEGIN;

-- СЕССИЯ 1
SELECT SUM(rating) FROM pizzeria;

-- СЕССИЯ 2
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5);
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Kazan Pizza';

-- СЕССИЯ 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;

SELECT SUM(rating) FROM pizzeria;

-- СЕССИЯ 2
SELECT SUM(rating) FROM pizzeria;