SELECT 
    COALESCE(p.name, '-') AS person_name,
    COALESCE(TO_CHAR(pv.visit_date, 'YYYY-MM-DD'), '-') AS visit_date,
    COALESCE(pz.name, '-') AS pizzeria_name
FROM 
    (SELECT id, name FROM person) p
FULL JOIN 
    (SELECT DISTINCT pv.person_id, pv.pizzeria_id, pv.visit_date
     FROM person_visits pv
     WHERE pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv
    ON p.id = pv.person_id
FULL JOIN 
    (SELECT id, name FROM pizzeria) pz
    ON pv.pizzeria_id = pz.id
ORDER BY 
    person_name NULLS FIRST,
    pizzeria_name NULLS FIRST,
    visit_date NULLS FIRST;