INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT 
    ROW_NUMBER() OVER () AS id,
    person_id,
    pizzeria_id,
    CASE
        WHEN amount_of_orders = 1 THEN 10.5
        WHEN amount_of_orders = 2 THEN 22
        ELSE 30
    END AS discount
FROM (
    SELECT 
        po.person_id,
        m.pizzeria_id,
        COUNT(po.id) AS amount_of_orders
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    GROUP BY po.person_id, m.pizzeria_id
) AS order_counts;

-- SELECT count(*) > 0 AS check
-- FROM person_discounts