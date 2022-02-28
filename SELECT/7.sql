with pcs as 
(
   SELECT
      Product.model as model,
      price as price 
   FROM
      Product 
      INNER JOIN
         pc 
         on Product.model = pc.model 
   WHERE
      maker = 'B' 
   group by
      Product.model,
      price 
)
,
laptops as 
(
   SELECT
      Laptop.model as model,
      price as price 
   FROM
      Laptop 
      INNER JOIN
         Product 
         on Laptop.model = Product.model 
   WHERE
      maker = 'B' 
   group by
      Laptop.model,
      price 
)
,
printers as 
(
   SELECT
      Printer.model as model,
      price as price 
   FROM
      Printer 
      INNER JOIN
         Product 
         on Printer.model = Product.model 
   WHERE
      maker = 'B' 
   group by
      Printer.model,
      price 
)
select
   * 
from
   laptops 
union all
select
   * 
from
   pcs 
union all
select
   * 
from
   printers
