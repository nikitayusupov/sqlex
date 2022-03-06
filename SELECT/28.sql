with maker_models as (
  Select 
    maker, 
    count(distinct model) as cnt_models 
  from 
    product 
  group by 
    maker
), 
one_makers as (
  select 
    distinct maker 
  from 
    maker_models 
  where 
    cnt_models = 1
) 
select 
  count(distinct maker) as maker_cnt 
from 
  product 
where 
  maker in (
    select 
      distinct * 
    from 
      one_makers
  )
