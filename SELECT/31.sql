with t as (
SELECT 
  class, 
  country 
FROM 
  classes 
WHERE 
  bore >= 16.0
)
select distinct * from t
