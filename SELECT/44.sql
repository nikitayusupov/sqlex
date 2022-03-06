with a as (
  select 
    distinct name 
  from 
    Ships 
  where 
    name LIKE 'R%'
), 
b as (
  SELECT 
    distinct Ship 
  From 
    Outcomes 
  where 
    ship like 'R%'
), 
final as (
  select 
    name as name 
  from 
    a 
  union all 
  select 
    ship as name 
  from 
    b
) 
select 
  distinct * 
from 
  final
