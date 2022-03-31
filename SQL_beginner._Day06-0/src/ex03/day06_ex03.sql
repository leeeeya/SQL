CREATE UNIQUE INDEX idx_person_discounts_unique on person_discounts (person_id, pizzeria_id);

Set enable_seqscan to off;
EXPLAIN ANALYZE
SELECT p2.name, p.name, discount_percentage
FROM person_discounts
JOIN pizzeria p on p.id = person_discounts.pizzeria_id
JOIN person p2 on person_discounts.person_id = p2.id;