with a as (
  select 
    battles.name as name 
  from 
    battles as battles 
  where 
    battles.date = '1944-10-25'
), 
b as (
  select 
    battles.name as name 
  from 
    battles as battles 
  where 
    battles.date = '1945-01-28'
) insert into outcomes (ship, battle, result) 
Values 
  (
    'Rodney' , 
    (
      select 
        name 
      from 
        a
    ), 
    'sunk'
  ), 
  (
    'Nelson' , 
    (
      select 
        * 
      from 
        b
    ) , 
    'damaged' 
  )
