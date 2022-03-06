with laptops as 
(
   select
      maker 
   from
      product 
   where
      type = 'laptop' 
)
SELECT
   maker 
FROM
   product 
WHERE
   maker not in 
   (
      select
         * 
      from
         laptops
   )
   and type = 'pc' 
group by
   maker
