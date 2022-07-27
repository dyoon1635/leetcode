delete from Person
where id not in (
    select sub.min_id
    from (
        select email, MIN(id) as min_id
        from Person
        group by email
    ) sub )