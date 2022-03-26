SELECT pizzeria.name
FROM (SELECT gender, person.id FROM person WHERE gender = 'female') as t1
JOIN (SELECT person_id, menu_id FROM person_order) as t2 on t1.id = t2.person_id
JOIN (SELECT id, pizzeria_id FROM menu) as t3 on t2.menu_id = t3.id
JOIN pizzeria on t3.pizzeria_id = pizzeria.id
EXCEPT
(SELECT pizzeria.name
FROM (SELECT gender, person.id FROM person WHERE gender = 'male') as t1
JOIN (SELECT person_id, menu_id FROM person_order) as t2 on t1.id = t2.person_id
JOIN (SELECT id, pizzeria_id FROM menu) as t3 on t2.menu_id = t3.id
JOIN pizzeria on t3.pizzeria_id = pizzeria.id)