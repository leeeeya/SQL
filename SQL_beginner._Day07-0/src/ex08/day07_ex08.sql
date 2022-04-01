SELECT person.address,
       pizzeria.name,
       count(menu_id)
FROM person_order
JOIN menu on menu_id = menu.id
JOIN pizzeria on menu.pizzeria_id = pizzeria.id
JOIN person on person_order.person_id = person.id
GROUP BY pizzeria.name, person.address
ORDER BY address, name