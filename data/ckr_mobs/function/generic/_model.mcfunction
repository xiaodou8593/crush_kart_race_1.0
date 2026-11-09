#ckr_mobs:generic/_model
# 使用临时对象构建数据模板
# 输出数据模板storage ckr_mobs:io result

data modify storage ckr_mobs:io result set value {center:[0.0d, 0.0d, 0.0d], hp:0, damage:0, entity_type:"", coins_range:[0.0d, 0.0d], last_attacker:""}

execute store result storage ckr_mobs:io result.center[0] double 0.0001 run scoreboard players get x int
execute store result storage ckr_mobs:io result.center[1] double 0.0001 run scoreboard players get y int
execute store result storage ckr_mobs:io result.center[2] double 0.0001 run scoreboard players get z int
execute store result storage ckr_mobs:io result.hp int 1 run scoreboard players get hp int
execute store result storage ckr_mobs:io result.damage int 1 run scoreboard players get damage int
data modify storage ckr_mobs:io result.entity_type set from storage ckr_mobs:io entity_type
execute store result storage ckr_mobs:io result.coins_range[0] double 1 run scoreboard players get coins_min int
execute store result storage ckr_mobs:io result.coins_range[1] double 1 run scoreboard players get coins_max int
data modify storage ckr_mobs:io result.last_attacker set from storage ckr_mobs:io last_attacker