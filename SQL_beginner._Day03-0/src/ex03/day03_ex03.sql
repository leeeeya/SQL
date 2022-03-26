SELECT pizzeria.name
FROM person
JOIN person_visits pv on person.id = pv.person_id
JOIN pizzeria on pv.pizzeria_id = pizzeria.id
WHERE gender = 'male'
EXCEPT ALL
SELECT pizzeria.name
FROM person
JOIN person_visits pv on person.id = pv.person_id
JOIN pizzeria on pv.pizzeria_id = pizzeria.id
WHERE gender = 'female';


