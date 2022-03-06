WITH battle_number_t AS (
  SELECT 
    name, 
    row_number() over(
      order by 
        battles.date
    ) as battle_number 
  FROM 
    battles as battles
), 
outcomes_battles AS (
  SELECT 
    battle_number_t.battle_number as battle_number, 
    outcomes.ship as ship 
  FROM 
    battle_number_t as battle_number_t 
    INNER JOIN outcomes as outcomes ON outcomes.battle = battle_number_t.name
), 
damaged_ships as (
  select 
    distinct ship 
  from 
    outcomes 
  where 
    result = 'damaged'
), 
t as (
  SELECT 
    ship, 
    min(battle_number) + 1 as next_battle_number, 
    count(distinct battle_number) cnt_battles 
  FROM 
    outcomes_battles 
  GROUP BY 
    ship
), 
ship_x_next_battle_number as (
  select 
    distinct t.ship as ship, 
    next_battle_number 
  from 
    t 
    inner join damaged_ships on t.ship = damaged_ships.ship 
  where 
    cnt_battles = 1
) INSERT INTO outcomes (ship, battle, result) 
SELECT 
  ship_x_next_battle_number.ship, 
  battle_number_t.name, 
  'sunk' 
FROM 
  ship_x_next_battle_number 
  INNER JOIN battle_number_t ON battle_number_t.battle_number = ship_x_next_battle_number.next_battle_number
