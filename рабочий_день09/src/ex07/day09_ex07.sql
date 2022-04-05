CREATE FUNCTION fnc_mleast(VARIADIC arr numeric[]) RETURNS numeric AS $$
    SELECT MIN($1[i]) FROM generate_subscripts($1, 1) AS g(i);
$$ LANGUAGE sql;

-- DROP FUNCTION fnc_mleast;

SELECT fnc_mleast(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);