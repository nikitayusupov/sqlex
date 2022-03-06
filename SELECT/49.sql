with a as (
  SELECT 
    distinct ships_.name as name 
  FROM 
    classes as classes_ 
    INNER JOIN ships as ships_ ON classes_.class = ships_.class 
  WHERE 
    classes_.bore = 16.0
), 
b as (
  SELECT 
    distinct outcomes_.ship as name 
  FROM 
    outcomes as outcomes_ 
    INNER JOIN classes as classes_ ON classes_.class = outcomes_.ship 
  WHERE 
    classes_.bore = 16.0
), 
final as (
  select 
    * 
  from 
    a 
  union all 
  select 
    * 
  from 
    b
) 
select 
  distinct * 
from 
  final
