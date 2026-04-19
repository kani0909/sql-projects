SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- СЕССИЯ 1 НАЧИНАЕМ ТРАНЗАКЦИЮ 
BEGIN;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';


-- Разблокирует сессию 2
COMMIT;


-- СЕССИЯ 2 НАЧИНАЕМ ТРАНЗАКЦИЮ 
BEGIN;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- ERROR:  could not serialize access due to concurrent update
--  защиты от потери обновлений на уровне REPEATABLE READ!
-- СРАЗУ ПОСЛЕ COMMIT в сессии 1 получит ОШИБКУ сериализации
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- откат транзакции
ROLlBACK;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';