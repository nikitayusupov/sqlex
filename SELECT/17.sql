with min_speed_t as (
  select 
    min(speed) as min_speed 
  from 
    pc
) 
, final as (
select 
  product.type as type, 
  product.model as model, 
  laptop.speed as speed 
from 
  product as product 
  inner join laptop as laptop on laptop.model = product.model 
where 
  laptop.speed < (
    select 
      min_speed 
    from 
      min_speed_t
  )
)

select distinct 
type, 
model, speed from final
