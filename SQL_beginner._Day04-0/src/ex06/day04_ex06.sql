CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
(SELECT pizzeria.name
FROM (SELECT name, id
        FROM person
        WHERE name = 'Dmitriy') as t1
JOIN (SELECT *
        FROM person_visits
        WHERE visit_date = '2022-01-08') as t2 on t1.id = t2.person_id
JOIN pizzeria on t2.pizzeria_id = pizzeria.id
JOIN menu on pizzeria.id = menu.pizzeria_id
WHERE price < 800);
