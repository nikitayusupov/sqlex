with hds as (
  SELECT 
    DISTINCT pc.hd as hd 
  FROM 
    pc as pc
), 
top3hd as (
  SELECT 
    top 3 hds.hd 
  FROM 
    hds as hds
  ORDER BY 
    hd
) 
DELETE FROM 
  pc 
WHERE 
  hd IN (
    select 
      * 
    from 
      top3hd
  )
