SELECT DISTINCT pizza_name, price, t2.name as pizzeria_name, visit_date
FROM (SELECT name, id FROM person WHERE name = 'Kate') as t1
JOIN (SELECT DISTINCT name, pizzeria_id, person_id, visit_date
        FROM pizzeria, person_visits WHERE pizzeria.id = person_visits.pizzeria_id) t2
        on t2.person_id = t1.id
JOIN (SELECT pizzeria_id, pizza_name, price
FROM menu WHERE price BETWEEN 800 AND 1000) as t3 on t3.pizzeria_id = t2.pizzeria_id
ORDER BY 1, 2, 3;






