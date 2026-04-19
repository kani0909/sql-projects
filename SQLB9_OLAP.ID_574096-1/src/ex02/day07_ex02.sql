(SELECT 
    pz.name AS name,
    COUNT(*) AS count,
    'order' AS action_type

FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.name
ORDER BY count DESC
LIMIT 3
)
UNION ALL 
(
 SELECT 
    pz.name AS name,
    COUNT(*) AS count,
    'vizit' AS action_type

FROM person_visits pv
JOIN pizzeria pz ON pz.id = pv.pizzeria_id
GROUP BY pz.name
ORDER BY count DESC
LIMIT 3   
)
ORDER BY action_type ASC, count DESC;