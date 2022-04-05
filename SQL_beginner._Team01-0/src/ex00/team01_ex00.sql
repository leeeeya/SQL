with t1 as
    (select
        currency_id,
        case
            when u."name" is null then ''
            else u."name"
        end as name,
        case
            when u.lastname is null then ''
            else u.lastname
        end as lastname,
        b.type,
        sum(b.money) as volume
    from dwh.balance b
    full join dwh."user" u on b.user_id = u.id
    group by 1,2,3,4)

select
        t1.name,
        t1.lastname,
        t1.type,
        t1.volume,
        case
            when c.name is null then ''
            else c.name
        end as currency_name,
        case
            when c.rate_to_usd is null then 1
            else c.rate_to_usd
        end as last_rate_to_usd,
        case
            when c.rate_to_usd is null then t1.volume
            else t1.volume * c.rate_to_usd
        end as total_volume_in_usd
from dwh.currency as c
right join t1 on t1.currency_id = c.id
and (c.id, c.name, c.updated) in
(select id, name, MAX(updated) from dwh.currency
group by 1, 2)
order by 1 desc, 2, 3;
