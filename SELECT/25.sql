with min_ram_t as (
  SELECT 
    MIN(ram) as min_ram 
  FROM 
    pc
), 
max_speed_t as (
  SELECT 
    MAX(speed) as max_speed 
  FROM 
    pc 
  WHERE 
    ram IN (
      select 
        * 
      from 
        min_ram_t
    )
), 
need_models as (
  SELECT 
    model 
  FROM 
    pc 
  WHERE 
    speed IN (
      select 
        * 
      from 
        max_speed_t
    ) 
    and ram IN (
      select 
        * 
      from 
        min_ram_t
    )
), 
printer_makers as (
  SELECT 
    maker 
  FROM 
    product 
  WHERE 
    type = 'printer'
), 
final as (
  SELECT 
    maker 
  FROM 
    product 
  WHERE 
    maker IN (
      select 
        * 
      from 
        printer_makers
    ) 
    and model IN (
      select 
        * 
      from 
        need_models
    )
) 
select 
  distinct * 
from 
  final
