INSERT INTO person_order
(SELECT generate_series((SELECT MAX(id) + 1 FROM person_order), (SELECT MAX(id) + 9 FROM person_order), 1), generate_series(1, 9, 1), menu.id, '2022-02-25' as order_date
FROM menu
WHERE pizza_name = 'greek pizza')