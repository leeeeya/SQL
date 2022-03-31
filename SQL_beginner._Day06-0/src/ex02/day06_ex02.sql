SELECT DISTINCT name, menu.pizza_name, menu.price,
       round(menu.price * (1 - discount_percentage / 100))
FROM menu
JOIN (SELECT person.name, menu_id, person.id
FROM person_order
JOIN person on person_order.person_id = person.id) as t1 on menu_id = menu.id
JOIN person_discounts on t1.id = person_id AND person_discounts.pizzeria_id = menu.pizzeria_id
ORDER BY 1, 2;
