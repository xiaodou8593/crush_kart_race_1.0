#ckr_mobs:generic/_zero
# 把临时对象的全部数据置0

scoreboard players set x int 0
scoreboard players set y int 0
scoreboard players set z int 0
scoreboard players set hp int 0
scoreboard players set damage int 0
data modify storage ckr_mobs:io entity_type set value ""
data modify storage ckr_mobs:io last_attacker set value ""
scoreboard players set coins_min int 0
scoreboard players set coins_max int 0