SELECT order_date,
       (SELECT CONCAT (name ,' (age:', age, ')')
           FROM person
           WHERE person_id = person.id) AS person_information
FROM person_order
ORDER BY order_date, person_information;