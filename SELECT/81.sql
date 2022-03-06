with clean_dt as (
  select 
    year(date) as year, 
    month(date) as month, 
    out as out 
  from 
    outcome as outcome
), 
sum_out_t as (
  select 
    clean_dt.year, 
    clean_dt.month, 
    sum(clean_dt.out) as sum_out 
  from 
    clean_dt as clean_dt 
  group by 
    year, 
    month
), 
max_sum_out_t as (
  select 
    max(sum_out) max_sum_out 
  from 
    sum_out_t
), 
biggest_year_month as (
  select 
    year, 
    month 
  from 
    sum_out_t 
  where 
    sum_out in (
      select 
        max_sum_out 
      from 
        max_sum_out_t
    )
) 
SELECT 
  outcome.* 
FROM 
  outcome as outcome 
  inner join biggest_year_month on year(outcome.date) = biggest_year_month.year 
  and month(outcome.date) = biggest_year_month.month
