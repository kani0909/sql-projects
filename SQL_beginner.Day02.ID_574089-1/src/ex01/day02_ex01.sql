SELECT days.date AS missing_date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS days(date)
LEFT JOIN (
    SELECT DISTINCT visit_date 
    FROM person_visits 
    WHERE person_id IN (1, 2)
) AS visited_days ON days.date = visited_days.visit_date
WHERE visited_days.visit_date IS NULL
ORDER BY missing_date;