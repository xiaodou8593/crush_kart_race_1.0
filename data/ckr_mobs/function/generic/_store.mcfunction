#ckr_mobs:generic/_store
# 临时对象赋值到实体对象
# 输入执行实体

scoreboard players operation @s x = x int
scoreboard players operation @s y = y int
scoreboard players operation @s z = z int
scoreboard players operation @s hp = hp int
scoreboard players operation @s damage = damage int
data modify entity @s data.entity_type set from storage ckr_mobs:io entity_type
scoreboard players operation @s coins_min = coins_min int
scoreboard players operation @s coins_max = coins_max int
data modify entity @s data.last_attacker set from storage ckr_mobs:io last_attacker