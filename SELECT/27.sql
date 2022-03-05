with maker_printer_t as (
  SELECT 
    maker as maker_printer 
  FROM 
    product 
  WHERE 
    type = 'printer' 
  group by 
    maker
), 
final as (
  SELECT 
    maker, 
    hd 
  FROM 
    pc as pc 
    INNER JOIN product as product 
    ON pc.model = product.model 
  WHERE 
    product.maker IN (
      select 
        maker_printer 
      from 
        maker_printer_t
    )
) 
select 
  maker, 
  avg(hd) as hd_avg 
from 
  final 
GROUP BY 
  maker
