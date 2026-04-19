-- Начало транзакции сессии 1
BEGIN;

-- Проверка изменений в сессии 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Обновление рейтинга Pizza Hut сессии 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- Проверка изменений в сессии 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Завершение транзакции сессия 1
COMMIT;

-- Начало транзакции сессии 2
BEGIN;

-- Проверка видимости изменений сеесия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- зависает так как нет коммита в первой сессии
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- Проверка видимости изменений сеесия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Завершение транзакции сессия 2
COMMIT;