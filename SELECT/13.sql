SELECT 
  AVG(speed) as avg_speed 
FROM 
  pc as pc 
  inner join product as product on pc.model = product.model 
WHERE 
  maker = 'A'
