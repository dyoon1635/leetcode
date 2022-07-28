select sub.customer_number
from (select customer_number, count(*) as cnt
    from Orders
    group by customer_number
    order by cnt DESC) sub
LIMIT 1