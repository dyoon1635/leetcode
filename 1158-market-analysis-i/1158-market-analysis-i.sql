with sub as (
    select buyer_id, count(*) over(partition by buyer_id) as cnt
    from orders
    where YEAR(order_date) = 2019
)

select distinct u.user_id as buyer_id, 
        u.join_date,
        IFNULL(sub.cnt, 0) as orders_in_2019
from  users as u left join sub
    on u.user_id = sub.buyer_id