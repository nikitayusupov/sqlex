WITH all_price AS (
  SELECT 
    price 
  FROM 
    pc 
  UNION 
  SELECT 
    price 
  FROM 
    printer 
  UNION 
  SELECT 
    price 
  FROM 
    laptop
), 
max_price_t as (
  select 
    max(price) as max_price 
  from 
    all_price
), 
models as (
  SELECT 
    model 
  FROM 
    pc 
  where 
    price in (
      select 
        max_price 
      from 
        max_price_t
    ) 
  UNION 
  SELECT 
    model 
  FROM 
    printer 
  where 
    price in (
      select 
        max_price 
      from 
        max_price_t
    ) 
  UNION 
  SELECT 
    model 
  FROM 
    laptop 
  where 
    price in (
      select 
        max_price 
      from 
        max_price_t
    )
) 
select 
  distinct model 
from 
  models
