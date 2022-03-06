SELECT 
  product.maker as maker 
FROM 
  product 
  INNER JOIN pc ON product.model = pc.model 
WHERE ( (pc.speed >= 450))
group by 
  product.maker
