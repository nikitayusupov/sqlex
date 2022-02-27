SELECT
   model,
   speed,
   hd 
FROM
   PC 
WHERE
   price < 600 
   AND 
   (
      cd = '24x'
      OR cd = '12x'
   )
