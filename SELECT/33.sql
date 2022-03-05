SELECT 
  ship as ship 
FROM 
  battles as battles 
  INNER JOIN outcomes as outcomes 
  ON outcomes.battle = battles.name 
WHERE 
  result = 'sunk' 
  and name = 'North Atlantic'
