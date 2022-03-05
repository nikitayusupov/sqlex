with first as (
  SELECT 
    distinct income_o.point as point, 
    income_o.date as date, 
    inc as inc, 
    out as out 
  FROM 
    income_o as income_o 
    LEFT JOIN outcome_o as outcome_o 
    ON income_o.date = outcome_o.date 
    and income_o.point = outcome_o.point
), 
second as (
  SELECT 
    distinct outcome_o.point as point, 
    outcome_o.date as date, 
    inc as inc, 
    out as out 
  FROM 
    outcome_o as outcome_o 
    LEFT JOIN income_o as income_o 
    ON outcome_o.date = income_o.date 
    and outcome_o.point = income_o.point
) 
select 
  * 
from 
  first 
union 
select 
  * 
from 
  second
