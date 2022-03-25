SELECT (SELECT name
FROM person
WHERE person_id = person.id) AS person_name,
(SELECT name
FROM pizzeria
WHERE pizzeria_id = pizzeria.id) AS pizzeria_name
FROM (SELECT pizzeria_id, person_id, visit_date FROM person_visits) AS t1 -- this is an internal query in a main FROM clause
WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09'
ORDER BY person_name, pizzeria_name desc;