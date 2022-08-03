with emp_rank as 
(select e.name as Employee, d.name as Department, e.salary,
        dense_rank() over(partition by e.departmentId
                          order by salary desc) as r
from employee as e join department as d
    on e.departmentId = d.id)
    
select Department, Employee, Salary
from emp_rank
where r <= 3