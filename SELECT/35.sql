SELECT 
  distinct product.model as model, 
  product.type as type 
FROM 
  product as product 
WHERE 
  NOT (
    lower(product.model) like '%[^0-9]%' 
    AND lower(product.model) like '%[^a-z]%'
  )
