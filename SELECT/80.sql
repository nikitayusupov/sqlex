with pc_product as (
  select 
    * 
  from 
    product 
  where 
    type = 'PC'
), 
pc_models as (
  SELECT 
    distinct model 
  FROM 
    PC
), 
final as (
  SELECT 
    product.maker as maker 
  FROM 
    pc_product as product 
  WHERE 
    NOT product.model IN (
      SELECT 
        pc_models.model
      FROM 
        pc_models
    )
) 
SELECT 
  product.maker as maker 
FROM 
  product as product 
WHERE 
  NOT product.maker IN (
    select 
      final.maker 
    from 
      final
  ) 
group by 
  product.maker
