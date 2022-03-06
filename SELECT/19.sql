SELECT 
  maker, 
  AVG(screen) as avg_screen 
FROM 
  product 
  INNER JOIN laptop ON laptop.model = product.model 
GROUP BY 
  maker
