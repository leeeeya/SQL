CREATE OR REPLACE VIEW v_person_female AS
SELECT *
FROM person
WHERE gender='female';

CREATE OR REPLACE VIEW v_person_male AS
SELECT *
FROM person
WHERE gender='male';

CREATE FUNCTION fnc_persons_female() RETURNS SETOF person AS $$
    SELECT *
    FROM v_person_female;
$$ LANGUAGE SQL;

CREATE FUNCTION fnc_persons_male() RETURNS SETOF person AS $$
    SELECT *
    FROM v_person_male;
$$ LANGUAGE SQL;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();