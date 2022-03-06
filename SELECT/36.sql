with a as (
  Select 
    ships.name as name 
  from 
    ships as ships 
  where 
    ships.class = ships.name
), 
b as (
  select 
    outcomes.ship as name 
  from 
    classes as classes 
    INNER JOIN outcomes as outcomes ON outcomes.ship = classes.class
), 
final as (
  select 
    * 
  from 
    a 
  union all 
  select 
    * 
  from 
    b
) 
select 
  distinct * 
from 
  final
