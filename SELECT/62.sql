with a as (
  select 
    sum(income_o.inc) as sum_inc 
  from 
    income_o as income_o
where date<'2001-04-15'
), 
b as (
  select 
    sum(outcome_o.out) as sum_out 
  from 
    outcome_o as outcome_o
where date<'2001-04-15'
) 
select 
  sum_inc - sum_out 
from 
  a, 
  b
