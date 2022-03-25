SELECT DISTINCT name
FROM
(SELECT name, id
FROM person
WHERE gender = 'female') t1
JOIN (SELECT person_id, menu_id FROM person_order) t2 on person_id = t1.id
JOIN (SELECT pizza_name, id FROM menu) t3 on t2.menu_id = t3.id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'cheese pizza'
ORDER BY name;