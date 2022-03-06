with a as (
  select 
    distinct name 
  from 
    Ships 
  where 
    name LIKE '% % %'
), 
b as (
  SELECT 
    distinct Ship 
  From 
    Outcomes 
  where 
    ship like '% % %'
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
