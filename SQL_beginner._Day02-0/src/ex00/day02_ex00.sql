SELECT name
FROM pizzeria
LEFT JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
WHERE person_id is NULL;
