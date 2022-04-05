with t1 as
(   select
        user_id,
        c.name as currency_name,
        money,
        b.updated as b_updated,
        c.updated as c_updated,
        c.rate_to_usd
    from dwh.balance as b
    join dwh.currency c on b.currency_id = c.id
        and b.updated >= c.updated),
t2 as
(   select
        user_id,
        c.name as currency_name,
        money,
        b.updated as b_updated,
        c.updated as c_updated,
        c.rate_to_usd
    from dwh.balance as b
    join dwh.currency c on b.currency_id = c.id
        and b.updated < c.updated),
t3 as
(select *
from t1
where (user_id, currency_name, money, b_updated, c_updated)
    in (select user_id, currency_name, money, b_updated, max(c_updated)
        from t1 group by 1,2,3,4)
union
    select *
from t2
where (user_id, currency_name, money, b_updated, c_updated)
in (select user_id, currency_name, money, b_updated, min(c_updated)
    from t2 group by 1,2,3,4)
    )
select case
            when u."name" is null then ''
            else u."name"
        end as name,
        case
            when u.lastname is null then ''
            else u.lastname
        end as lastname,
       currency_name,
       money * rate_to_usd as currency_in_usd
from t3
left join dwh."user" u on t3.user_id = u.id
where (user_id, currency_name, money, b_updated, c_updated)
in (select user_id, currency_name, money, b_updated, min(c_updated)
    from t3 group by 1,2,3,4)
order by 1 desc, 2,3;
