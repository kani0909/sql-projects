-- СЕССИЯ 1 НАЧИНАЕМ ТРАНЗАКЦИЮ
BEGIN;

-- СЕССИЯ 2 НАЧИНАЕМ ТРАНЗАКЦИЮ
BEGIN; 

-- СЕССИЯ 1
-- Обновляем пиццерию с id = 1
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;

-- СЕССИЯ 2
-- Обновляем пиццерию с id = 2
UPDATE pizzeria SET rating = 2.0 WHERE id = 2;

-- СЕССИЯ 1
-- Пытаемся обновить пиццерию с id = 2 (которая заблокирована сессией 2) будет ждать!
UPDATE pizzeria SET rating = 2.0 WHERE id = 2;

-- СЕССИЯ 2
-- Пытаемся обновить пиццерию с id = 1 (которая заблокирована сессией 1)
-- ПОЛУЧИМ ОШИБКУ ВЗАИМОБЛОКИРОВКИ
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;


-- СЕССИЯ 1
COMMIT;

-- СЕССИЯ 2
-- Транзакция автоматически откатывается
COMMIT;


-- SELECT * FROM pizzeria WHERE id = '2';