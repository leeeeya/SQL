CREATE FUNCTION fnc_fibonacci(pstop integer default 10) RETURNS SETOF integer AS $$
    WITH RECURSIVE t(a, b) AS (
            VALUES(0, 1)
        UNION ALL
            SELECT greatest(a, b), a + b AS a FROM t
            WHERE b < $1
    )
    SELECT a FROM t;
$$ LANGUAGE sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();