INSERT INTO person_discounts
(SELECT row_number() over () as id,
        person_id, pizzeria_id,
        CASE
           WHEN count = 1 THEN 10.5
            WHEN count = 2 THEN 22
            ELSE 30
        END AS discount_percentage
FROM
(SELECT DISTINCT person_id, pizzeria_id, count(pizzeria_id) as count
    FROM person_order
    JOIN menu on person_order.menu_id = menu.id
    GROUP BY person_id, pizzeria_id
) as t1
ORDER BY person_id)