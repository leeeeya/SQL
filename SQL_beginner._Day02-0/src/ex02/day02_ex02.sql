SELECT
       CASE
           WHEN person.name is NULL
               THEN '-'
           ELSE person.name
           END AS person_name,
       visit_date,
       CASE
           WHEN pizzeria.name is NULL
               THEN '-'
           ELSE pizzeria.name
           END AS pizzeria_name
FROM person
    FULL JOIN
    (SELECT visit_date, person_id, pizzeria_id
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') t1 on t1.person_id = person.id
FULL JOIN pizzeria on pizzeria.id = t1.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;
