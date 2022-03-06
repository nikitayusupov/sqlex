with eb_product as (
  select 
    distinct product.model as model 
  from 
    product as product 
  where 
    lower(product.maker) = 'b' 
    or lower(product.maker) = 'e'
) 
update 
  laptop 
set 
  screen = screen + 1.0, 
  price = price - 100.0 
where 
  model in (
    select 
      model 
    from 
      eb_product
  )
