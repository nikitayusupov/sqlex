with t as (
  SELECT 
    hd, 
    count(*) cnt 
  FROM 
    pc 
  GROUP BY 
    hd
) 
select 
  distinct hd 
from 
  t 
where 
  cnt > 1
