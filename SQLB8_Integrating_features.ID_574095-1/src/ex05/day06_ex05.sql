COMMENT ON TABLE person_discounts IS 'Personal discounts for customers by pizzeria';
COMMENT ON COLUMN person_discounts.id IS 'Primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'Foreign key to person table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Foreign key to pizzeria table';
COMMENT ON COLUMN person_discounts.discount IS 'Discount percentage (0-100)';


-- SELECT count(*) = 5 AS check
-- FROM pg_description
-- WHERE objoid = 'person_discounts'::regclass