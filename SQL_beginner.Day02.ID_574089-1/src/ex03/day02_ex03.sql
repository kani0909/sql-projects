WITH date_range AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS date),
person_visits_filtered AS (
    SELECT DISTINCT visit_date 
    FROM person_visits 
    WHERE person_id = 1 OR person_id = 2
)
SELECT date_range.date::date AS missing_date
FROM date_range
LEFT JOIN person_visits_filtered pvf ON date_range.date = pvf.visit_date
WHERE pvf.visit_date IS NULL
ORDER BY missing_date;