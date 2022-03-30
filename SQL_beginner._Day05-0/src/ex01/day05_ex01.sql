Set enable_seqscan to off;

EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name as pizzeria_name
FROM menu
JOIN pizzeria on menu.pizzeria_id = pizzeria.id;



