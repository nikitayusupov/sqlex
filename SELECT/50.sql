with kongos as (
  select 
    ships.name as name 
  from 
    ships as ships 
  where 
    lower(ships.class) = 'kongo'
) 
select 
  outcomes.battle as battle 
from 
  outcomes as outcomes 
where 
  outcomes.ship in (
    select 
      * 
    from 
      kongos
  ) 
group by 
  battle
