with sub as (select s1.id, s2.student
from seat as s1, seat as s2
where mod(s1.id, 2) = 1 and s1.id + 1 = s2.id
union
select s1.id, s2.student
from seat as s1, seat as s2
where mod(s1.id, 2) = 0 and s1.id - 1 = s2.id)

select seat.id, ifnull(sub.student, seat.student) as student
from seat left join sub
    on seat.id = sub.id
order by seat.id