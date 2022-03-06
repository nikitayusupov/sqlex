with a_product as (
  select 
    * 
  from 
    product 
  where 
    maker = 'A'
), 
final as (
  SELECT 
    price as price 
  FROM 
    pc as pc 
    INNER JOIN a_product as product ON product.model = pc.model 
  UNION ALL 
  SELECT 
    price as price 
  FROM 
    laptop as laptop 
    INNER JOIN a_product as product ON product.model = laptop.model
) 
select 
  avg(price) as answer 
from 
  final
