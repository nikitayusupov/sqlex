with t as (
  SELECT 
    pc_1.model as model_1, 
    pc_2.model as model_2, 
    pc_1.speed as speed, 
    pc_1.ram as ram 
  FROM 
    pc as pc_1 
    inner join pc as pc_2 on pc_1.speed = pc_2.speed 
    and pc_1.ram = pc_2.ram
) 
select 
  distinct model_1, 
  model_2, 
  speed, 
  ram 
from 
  t 
WHERE 
  model_2 < model_1
