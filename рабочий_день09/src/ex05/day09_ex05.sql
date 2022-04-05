DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender varchar default 'female') RETURNS SETOF person AS $$
    SELECT *
    FROM (SELECT *
        FROM v_person_male
        UNION
        SELECT *
        FROM v_person_female) AS t
    WHERE t.gender=pgender;
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();