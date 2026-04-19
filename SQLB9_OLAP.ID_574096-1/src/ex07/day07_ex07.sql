SELECT 
    ROUND(AVG(rating)::NUMERIC, 4) AS global_rating
FROM pizzeria;