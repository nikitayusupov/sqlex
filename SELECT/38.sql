with t1 as (
  SELECT 
    country 
  FROM 
    classes 
  where 
    type = 'bb'
), 
t2 as (
  SELECT 
    country 
  FROM 
    classes 
  where 
    type = 'bc'
) 
select 
  distinct t1.country 
from 
  t1 
  inner join t2 on t1.country = t2.country
