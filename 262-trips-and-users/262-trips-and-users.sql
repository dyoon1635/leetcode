with sub as
(select client_id, driver_id, request_at, status
from Trips
where client_id not in (
    select users_id 
    from Users 
    where banned like 'Yes'
        and role like 'client'
) and
driver_id not in (
    select users_id 
    from Users 
    where banned like 'Yes'
        and role like 'driver'
))

select request_at as Day,
    round(count(case when status like 'can%' then 1 end) / count(*), 2) as 'Cancellation Rate'
from sub
where request_at between '2013-10-01' and '2013-10-03'
group by request_at
