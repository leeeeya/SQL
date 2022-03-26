SELECT pizza_name, price, pizzeria.name
FROM menu
JOIN (SELECT id as menu_id
FROM menu
EXCEPT
SELECT menu_id
FROM person_order) as t1 on menu_id = id
JOIN pizzeria on menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2

