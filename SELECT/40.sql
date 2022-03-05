with t as (
  SELECT 
    maker, 
    COUNT(DISTINCT type) cnt_types, 
    COUNT(DISTINCT model) cnt_models 
  FROM 
    product 
  GROUP BY 
    maker
), 
final as (
  select 
    maker
  from 
    t 
  where 
    cnt_types = 1 
    and cnt_models > 1
) 
select 
  distinct maker, 
  type 
from 
  product 
where 
  maker in (
    select 
      maker
    from 
      final
  )
