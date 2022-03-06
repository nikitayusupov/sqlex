SELECT DISTINCT
   product.maker as maker
   , laptop.speed as speed
FROM
   product
   INNER JOIN
      laptop
      ON product.model = laptop.model 
WHERE
   laptop.hd >= 10
