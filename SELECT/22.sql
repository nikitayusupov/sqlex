SELECT 
  speed as speed
  , AVG(price) as avg_price 
FROM 
  pc 
WHERE 
  speed >= 600.01 
GROUP BY 
  speed
