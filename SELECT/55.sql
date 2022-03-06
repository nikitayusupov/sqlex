with min_launched_t as (
  SELECT 
    ships.class as class, 
    MIN(launched) AS min_launched 
  FROM 
    ships as ships 
  GROUP BY 
    class
) 
SELECT 
  classes.class as class, 
  min_launched_t.min_launched as min_launched 
FROM 
  classes as classes 
  LEFT JOIN min_launched_t 
  ON classes.class = min_launched_t.class
