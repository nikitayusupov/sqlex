with printer_y as (
  select 
    * 
  from 
    printer 
  where 
    color = 'y'
), 
min_price_t as (
  select 
    min(price) as min_price 
  from 
    printer_y
), 
final as (
  SELECT 
    product.maker as maker, 
    printer.price as price 
  FROM 
    product as product 
    inner join printer_y as printer on product.model = printer.model 
  WHERE 
    printer.price = (
      SELECT 
        min_price 
      FROM 
        min_price_t
    )
) 
select 
  distinct * 
from 
  final
