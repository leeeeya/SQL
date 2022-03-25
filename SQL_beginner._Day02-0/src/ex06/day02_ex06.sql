SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM pizzeria
    JOIN
(SELECT pizza_name, name, pizzeria_id
FROM menu
JOIN person_order on menu_id = menu.id
JOIN person on person_id = person.id
WHERE name = 'Denis' OR name = 'Anna') t2 on pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name;
