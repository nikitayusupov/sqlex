SELECT 
  ships.name as name 
FROM 
  ships as ships 
  INNER JOIN classes as classes 
  ON classes.class = ships.class 
WHERE 
  (classes.country is null or lower(classes.country) = 'japan')
  and (classes.bore is null or classes.bore < 19.0 )
  and (displacement is null or displacement <= 65000.0)
  and (classes.type is null or lower(classes.type) = 'bb' )
  and (numguns is null or numguns >= 9.0)
group by 
    ships.name
