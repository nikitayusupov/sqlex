with maker_x_types as (
SELECT 
  maker 
 , count(distinct product.type) as types
FROM 
  product as product
GROUP BY 
  maker 
) 
, one_type_makers as (
    select maker from maker_x_types
    where types = 1
)
, maker_x_models as (
SELECT 
  maker 
 , count(distinct product.model) as models
FROM 
  product as product
GROUP BY 
  maker 
)
, three_models_makers as (
select maker from maker_x_models
where models >= 3
)
, laptop_makers as (
select maker from product
where lower(type) = 'laptop'
)
, pc_makers as (
select maker from product
where lower(type) = 'pc'
)
, printer_makers as (
select maker from product
where lower(type) = 'printer'
)
select distinct maker from Product
where maker in (select * from one_type_makers)
and NOT maker in (select * from laptop_makers)
and (
    (
     (maker in (select * from pc_makers))
     and 
     (maker in (select * from three_models_makers))
    )
    
    or (maker in (select * from printer_makers))
)
