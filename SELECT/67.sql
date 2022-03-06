with routes as (
  select 
    trip.town_from as town_from, 
    trip.town_to as town_to, 
    count(distinct trip_no) as cnt 
  from 
    trip as trip 
  group by 
    trip.town_from, 
    trip.town_to
), 
max_routes as (
  select 
    max(cnt) max_cnt 
  from 
    routes
) 
select 
  count(*) as answer 
from 
  routes 
where 
  cnt in (
    select 
      * 
    from 
      max_routes
  )
