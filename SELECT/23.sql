with laptop_750 as (
  select 
    * 
  from 
    laptop 
  where 
    speed >= 750.0
), 
t as (
  SELECT 
    maker 
  FROM 
    product as product 
    INNER JOIN laptop_750 as laptop 
    ON product.model = laptop.model
), 
pc_750 as (
  select 
    * 
  from 
    pc 
  where 
    speed >= 750.0
), 
final as (
  SELECT 
    maker as maker 
  FROM 
    product as product 
    INNER JOIN pc_750 as pc 
    ON product.model = pc.model 
  WHERE 
    maker IN (
      select 
        * 
      from 
        t
    )
) 
select 
  distinct maker 
from 
  final
