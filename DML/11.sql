with cd_sub as (
  select 
    SUBSTRING(
      cd, 
      1, 
      len(cd) -1 + 0
    ) as cd 
  from 
    pc
), 
cd_int as (
  select 
    cast(cd as int) as cd 
  from 
    cd_sub
), 
cd_max_int as (
  select 
    max(cd) as cd 
  from 
    cd_int
), 
cd_max_str as (
  select 
    cast(cd as VARCHAR) as cd 
  from 
    cd_max_int
), 
cd_final as (
  select 
    (cd + 'x') as cd 
  from 
    cd_max_str
) 

INSERT INTO PC (
  code, model, speed, ram, hd, cd, price
) 


SELECT 
  (min(code) + 20.0) as code, 
  (cast(model as int) + 1000) as model, 
  max(laptop.speed * 1.0) as speed, 
  max(laptop.ram * 1.0) * 2.0, 
  max(laptop.hd * 1.0) * 2.0 as hd, 
  (
    select 
      * 
    from 
      cd_final
  ) as cd, 
  MAX(laptop.price * 1.0) / 1.5 as price 
FROM 
  laptop as laptop 
GROUP BY 
  model
