UPDATE 
  Product 
SET 
  maker = 'Z' 
WHERE 
  lower(Product.maker) = 'a' 
  and lower(Product.type) = 'printer'
