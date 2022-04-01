SELECT pizzeria.name,
       count(menu_id) AS count_of_orders,
       round(SUM(price) / count(menu_id), 2) as average_price	,
        MAX(price) as min_price, MIN(price) as max_price
FROM person_order
JOIN menu on menu_id = menu.id
JOIN pizzeria on menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 1