with max_code_t as (
   SELECT 
      MAX(code) max_code
    FROM 
      PC
)
, max_speed_t as (
 SELECT 
      MAX(speed) max_speed
    FROM 
      PC)
      
, max_ram_t as (
    SELECT 
      MAX(ram) as max_ram
    FROM 
      PC
)
, max_hd_t as (
    SELECT 
      MAX(hd) as max_hd
    FROM 
      PC
)
, avg_price_t as (
    SELECT 
      AVG(price) as avg_price
    FROM 
      PC
)
, pc_product as (
select * from product where type = 'PC' 
)
, pc_models as (
    SELECT distinct
      model 
    FROM 
      pc
)
, cd_sub as (
select SUBSTRING(cd, 1, len(cd) - 1 + 0) as cd 
from pc
)
, cd_int as (
select cast(cd as int) as cd from cd_sub
)
, cd_max_int as (
select max(cd) as cd from cd_int
)
, cd_max_str as (
select cast(cd as VARCHAR) as cd from cd_max_int
)
, cd_final as (
select (cd + 'x') as cd from cd_max_str
)

INSERT INTO pc (
  code, model, speed, ram, hd, cd, price
) 
SELECT 
  (select * from max_code_t) + model AS code, 
  model, 
  (select * from max_speed_t) AS speed, 
  (select * from max_ram_t) AS ram, 
  (select * from max_hd_t) AS hd, 
  (select * from cd_final) as cd, 
  (select * from avg_price_t) AS price 
FROM 
  pc_product as product 
WHERE 
   NOT model IN (select * from pc_models)
