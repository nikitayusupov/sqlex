SELECT 
  ships.class as class 
  , name
  , country 
FROM 
  ships 
  INNER JOIN classes 
on ships.class = classes.class
WHERE 
  numGuns >= 10
