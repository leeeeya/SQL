CREATE INDEX idx_menu_unique on menu(pizzeria_id, pizza_name);
Set enable_seqscan to off;
EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name
FROM menu