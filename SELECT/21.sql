SELECT 
  maker as maker, 
  MAX(price) as max_price 
FROM 
  product as product 
  inner join pc as pc on pc.model = product.model 
GROUP BY 
  maker
