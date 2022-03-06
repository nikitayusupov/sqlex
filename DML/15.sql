with max_code_t as (
  select 
    max(pc.code) as max_code 
  from 
    pc as pc 
  group by 
    pc.model
) 
delete from 
  pc 
where 
  not code in (
    select 
      max_code 
    from 
      max_code_t
  )
