SELECT pz.name AS pizzeria_name
FROM person_visits pv 
JOIN person p ON p.id = pv.person_id
JOIN pizzeria pz ON pz.id = pv.pizzeria_id
WHERE p.name = 'Andrey'
AND pv.pizzeria_id NOT IN (
    SELECT DISTINCT m.pizzeria_id
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN person p ON p.id = po.person_id
    WHERE p.name = 'Andrey'
)
ORDER BY pizzeria_name