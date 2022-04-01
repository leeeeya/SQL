(SELECT pizzeria.name,
       count(menu_id), 'order' AS action_type
FROM person_order
JOIN menu on menu_id = menu.id
JOIN pizzeria on menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 2 DESC
LIMIT 3)
UNION
(SELECT pizzeria.name,
       count(visit_date), 'visit' AS action_type
FROM person_visits
JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 2 DESC
LIMIT 3)
ORDER BY 3, 2 DESC