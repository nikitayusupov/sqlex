with 
pc_models as (
    select distinct model from pc
),
laptop_models as (
    select distinct model from laptop
),
printer_models as (
    select distinct model from printer
),
all_models as (
    select distinct model from pc_models
    union all 
    select distinct model from laptop_models
    union all 
    select distinct model from printer_models
),
all_models_dis as (
    select distinct model from all_models
)
delete from 
  product 
where 
  NOT model in (
    select all_models_dis.model from all_models_dis
  )
