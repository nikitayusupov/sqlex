with maker_models as (
  select 
    maker, 
    count(distinct model) models 
  from 
    product 
  group by 
    maker
), 
min_models as (
  select 
    min(models) as min_md
  from 
    maker_models
), 
max_models as (
  select 
    max(models) as max_md
  from 
    maker_models
) 
select 
  * 
from 
  maker_models 
where 
  models in (
    select 
      * 
    from 
      min_models
  ) 
  or models in (
    select 
      * 
    from 
      max_models
  )
