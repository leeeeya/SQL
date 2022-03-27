CREATE VIEW v_price_with_discount AS
(SELECT person.name, pizza_name, price, price * 0.9 AS discount_price
FROM person_order
JOIN person on person_order.person_id = person.id
JOIN menu on menu_id = menu.id
ORDER BY name, pizza_name)
