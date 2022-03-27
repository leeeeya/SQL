INSERT INTO person_visits
    VALUES ((SELECT MAX(id) FROM person_visits) + 1,
            (SELECT id FROM person WHERE name = 'Dmitriy'),
(SELECT pizzeria.id
FROM pizzeria
JOIN menu on pizzeria.id = menu.pizzeria_id
WHERE price < 800 AND pizzeria.id NOT IN
(SELECT pizzeria.id
FROM person_visits
JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
JOIN person on person_visits.person_id = person.id
WHERE person.name = 'Dmitriy')), '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;