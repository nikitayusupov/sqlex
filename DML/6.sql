with printers as (
  select 
    product.maker as maker 
  from 
    product as product 
  where 
    product.type = 'Printer'
), 
final as (
  select 
    Product.model as model 
  from 
    Product as Product 
  where 
    Product.maker in (
      select 
        printers.maker 
      from 
        printers as printers
    )
) 
Delete from 
  Laptop
where 
  Laptop.model not in (
    select 
      final.model 
    from 
      final as final
  )
