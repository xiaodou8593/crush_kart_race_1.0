#ckr_utils:strip_area/_store
# 临时对象赋值到实体对象
# 输入执行实体

scoreboard players operation @s x = x int
scoreboard players operation @s y = y int
scoreboard players operation @s z = z int
scoreboard players operation @s chunk_x_min = chunk_x_min int
scoreboard players operation @s chunk_z_min = chunk_z_min int
scoreboard players operation @s chunk_x_max = chunk_x_max int
scoreboard players operation @s chunk_z_max = chunk_z_max int
scoreboard players operation @s d = d int
scoreboard players operation @s h = h int
scoreboard players operation @s l = l int
data modify entity @s data.run_func set from storage ckr_utils:io run_func