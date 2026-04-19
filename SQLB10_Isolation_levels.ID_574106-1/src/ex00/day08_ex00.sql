-- Начало транзакции сессии 1
BEGIN;

-- Обновление рейтинга Pizza Hut сессии 1
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

-- Проверка изменений в сессии 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';



-- Проверка видимости изменений сеесия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Завершение транзакции сессия 1
COMMIT;


-- Проверка видимости изменений сеесия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';