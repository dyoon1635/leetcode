select s.name
from salesperson as s
where s.sales_id not in
(select o.sales_id
from orders o left join company c
on o.com_id = c.com_id
where c.name = 'RED')