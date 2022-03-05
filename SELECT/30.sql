with first as (
  select 
    point as point_code, 
    date as day, 
    SUM(inc) as inc_sum, 
    0 as out_sum 
  from 
    Income 
  Group by 
    point, 
    date
), 
second as (
  select 
    point as point_code, 
    date as day, 
    0 as inc_sum, 
    SUM(out) as out_sum 
  from 
    Outcome 
  Group by 
    point, 
    date
), 
pre_final as (
  select 
    * 
  from 
    first 
  UNION ALL 
  select 
    * 
  from 
    second
), 
final as (
  select 
    point_code, 
    day, 
    SUM(out_sum) as out_sum, 
    SUM(inc_sum) as inc_sum 
  from 
    pre_final 
  group by 
    point_code, 
    day
) 
select 
  point_code, 
  day, 
  case when out_sum = 0 then NULL else out_sum end as out_sum, 
  case when inc_sum = 0 then NULL else inc_sum end as inc_sum 
from 
  final
