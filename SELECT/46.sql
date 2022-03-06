with one as (
  SELECT 
    name as name, 
    displacement, 
    numGuns 
  FROM 
    ships 
    INNER JOIN classes 
    ON classes.class = ships.class
), 
two as (
  SELECT 
    class as name, 
    displacement, 
    numGuns 
  FROM 
    Classes
), 
final as (
  select 
    * 
  from 
    one 
  UNION 
  select 
    * 
  from 
    two
), 
Guadalcanal_outcomes as (
  select 
    * 
  from 
    outcomes 
  where 
    battle = 'Guadalcanal'
) 
SELECT 
  outcomes.ship as ship, 
  displacement, 
  numGuns 
FROM 
  Guadalcanal_outcomes as outcomes 
  LEFT JOIN final ON outcomes.ship = final.name
