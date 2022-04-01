SELECT DISTINCT name,
                SUM(count) AS total_count
FROM ((SELECT pizzeria.name,
       count(menu_id), 'order' AS action_type
FROM person_order
JOIN menu on menu_id = menu.id
FULL JOIN pizzeria on menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 2 DESC)
UNION
(SELECT pizzeria.name,
       count(visit_date), 'visit' AS action_type
FROM person_visits
FULL JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 2 DESC)
ORDER BY 3, 2 DESC) as t1
GROUP BY name
ORDER BY total_count DESC;