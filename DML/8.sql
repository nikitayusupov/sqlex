with sunk_ships as (
  SELECT 
    distinct outcomes.ship as name 
  FROM 
    outcomes as outcomes 
  WHERE 
    outcomes.result = 'sunk'
) 
DELETE FROM 
  ships 
WHERE 
  ships.name IN (
    select 
      sunk_ships.name 
    from 
      sunk_ships
  )
