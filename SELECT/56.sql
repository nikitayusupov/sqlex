with sunks as (
  SELECT 
    outcomes.ship as ship, 
    ships.class as class 
  FROM 
    outcomes as outcomes 
    LEFT JOIN ships as ships ON ships.name = outcomes.ship 
  WHERE 
    outcomes.result = 'sunk'
), 
t as (
  select 
    classes.class as class, 
    ship 
  from 
    classes as classes 
    LEFT JOIN sunks as sunks ON sunks.class = classes.class 
  union all 
  select 
    classes.class as class, 
    ship 
  from 
    classes as classes 
    LEFT JOIN sunks as sunks ON sunks.ship = classes.class
) 
SELECT 
  class as class, 
  COUNT(distinct ship) ship_cnt 
FROM 
  t 
GROUP BY 
  class
