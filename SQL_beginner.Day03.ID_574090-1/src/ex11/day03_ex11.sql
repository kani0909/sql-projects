UPDATE menu
SET price = CAST(price * 0.9 AS INTEGER)
WHERE pizza_name = 'greek pizza';
