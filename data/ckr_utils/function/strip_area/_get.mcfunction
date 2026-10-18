#ckr_utils:strip_area/_get
# 实体对象赋值到临时对象
# 输入执行实体

scoreboard players operation x int = @s x
scoreboard players operation y int = @s y
scoreboard players operation z int = @s z
scoreboard players operation chunk_x_min int = @s chunk_x_min
scoreboard players operation chunk_z_min int = @s chunk_z_min
scoreboard players operation chunk_x_max int = @s chunk_x_max
scoreboard players operation chunk_z_max int = @s chunk_z_max
scoreboard players operation d int = @s d
scoreboard players operation h int = @s h
scoreboard players operation l int = @s l
data modify storage ckr_utils:io run_func set from entity @s data.run_func