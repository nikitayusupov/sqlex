with sunk_ships as (
  SELECT 
    distinct outcomes.ship as ship 
  FROM 
    outcomes as outcomes 
  WHERE 
    outcomes.result = 'sunk'
) 
SELECT 
  distinct Classes.class as class 
FROM 
  Ships as Ships 
  RIGHT JOIN Classes as Classes  
  ON Classes.class = Ships.class 
WHERE 
  Ships.name IN (
    SELECT 
      * 
    from 
      sunk_ships
  ) 
  OR Classes.class IN (
    select 
      * 
    from 
      sunk_ships
  )
