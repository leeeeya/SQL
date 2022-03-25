SELECT DISTINCT name
FROM
(SELECT name, id
FROM person
WHERE (address = 'Moscow' OR address = 'Samara') AND gender = 'male') t1
JOIN person_order on person_id = t1.id
JOIN menu on menu_id = menu.id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY name desc ;
