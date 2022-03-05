SELECT 
  distinct name 
from 
  classes as classes 
  INNER JOIN ships as ships ON classes.class = ships.class 
where 
  displacement > 35000.0 
  and launched >= 1922.0 
  and type = 'bb'
