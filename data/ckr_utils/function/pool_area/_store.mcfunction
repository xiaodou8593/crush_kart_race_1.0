#ckr_utils:pool_area/_store
# 临时对象赋值到实体对象
# 输入执行实体

scoreboard players operation @s x = x int
scoreboard players operation @s y = y int
scoreboard players operation @s z = z int
scoreboard players operation @s d = d int
scoreboard players operation @s l = l int
scoreboard players operation @s spawn_interval = spawn_interval int
scoreboard players operation @s spawn_timer = spawn_timer int
scoreboard players operation @s spawn_max = spawn_max int
data modify entity @s data.spawn_plates set from storage ckr_utils:io spawn_plates