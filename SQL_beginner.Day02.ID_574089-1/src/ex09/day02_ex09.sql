SELECT DISTINCT p.name
FROM person p
JOIN person_order po ON p.id = po.person_id
JOIN menu m ON po.menu_id = m.id
WHERE p.gender = 'female'
  AND (m.pizza_name LIKE '%pepperoni%' OR m.pizza_name LIKE '%cheese%')
ORDER BY p.name;