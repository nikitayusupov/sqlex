with min_ram_t as (
  select 
    MIN(ram) as min_ram 
  from 
    pc
), 
min_hd_t as (
  select 
    MIN(hd) as min_hd 
  from 
    pc
) 
DELETE FROM 
  PC 
WHERE 
  pc.ram in (
    select 
      min_ram 
    from 
      min_ram_t
  ) 
  or pc.hd in (
    select 
      min_hd 
    from 
      min_hd_t
  )
