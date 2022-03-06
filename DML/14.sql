with a as (
  select 
    class as class, 
    count(distinct name) cnt 
  from 
    ships 
  group by 
    class
), 
name_ships as (
  select 
    name 
  from 
    ships
), 
b as (
  select 
    ship as class, 
    count(distinct ship) cnt 
  from 
    outcomes 
  where 
    ship not in (
      select 
        name 
      from 
        name_ships
    ) 
  group by 
    ship
), 
pre_final_0 as (
  select 
    * 
  from 
    a 
  union all 
  select 
    * 
  from 
    b
), 
pre_final as (select distinct * from pre_final_0 ),
final as (
  select 
    pre_final.class as class, 
    sum(pre_final.cnt) as cnt 
  from 
    pre_final 
  group by 
    pre_final.class
), 
final_2 as (
  select 
    class 
  from 
    final 
  where 
    cnt >= 3
) 
delete from 
  classes 
where 
  NOT class in (
    select 
      class 
    from 
      final_2
  )
