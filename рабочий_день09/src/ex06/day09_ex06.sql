CREATE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar default 'Dmitriy',
    pprice numeric default 500,
    pdate date default '2022-01-01')
RETURNS TABLE(name varchar) AS $$
    SELECT DISTINCT t.name
    FROM (SELECT pizzeria.name
        FROM person_visits
        LEFT JOIN person ON person_visits.person_id = person.id
        LEFT JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
        WHERE person.name=pperson AND visit_date=pdate) AS t
    WHERE t.name IN (SELECT name
        FROM menu
        LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        WHERE price < pprice)
$$ LANGUAGE SQL;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');