CREATE SEQUENCE seq_person_discounts START 1;
ALTER TABLE person_discounts
ALTER COLUMN id
SET DEFAULT nextval('seq_person_discounts');

SELECT setval('seq_person_discounts', (SELECT MAX(id) FROM person_discounts));

-- INSERT INTO person_discounts (person_id, pizzeria_id, discount_percentage)
-- VALUES (1, 2, 10.0);
--
-- DROP SEQUENCE seq_person_discounts CASCADE ;

