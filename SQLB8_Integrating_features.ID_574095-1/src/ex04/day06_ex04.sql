ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_person_id CHECK (person_id is not null),
ADD constraint ch_nn_pizzeria_id CHECK (pizzeria_id is not null),
ADD constraint ch_nn_discount CHECK (discount is not null),
ALTER COLUMN discount SET DEFAULT 0,
ADD CONSTRAINT ch_range_discount CHECK (discount BETWEEN 0 AND 100);


-- SELECT column_default::integer = 0 AS check
-- FROM information_schema.columns
-- WHERE COLUMN_NAME = 'discount'
--   AND TABLE_NAME = 'person_discounts'