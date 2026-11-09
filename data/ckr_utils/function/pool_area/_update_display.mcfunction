#ckr_utils:pool_area/_update_display
# 更新展示设置(屏障底座)
# 传入世界实体为执行者

# 计算对角线坐标
execute store result score temp_x_min int store result storage ckr_utils:io x_max double 0.0001 run scoreboard players operation temp_x_max int = d int
execute store result score temp_z_min int store result storage ckr_utils:io z_max double 0.0001 run scoreboard players operation temp_z_max int = l int
execute store result storage ckr_utils:io x_min double 0.0001 run scoreboard players operation temp_x_min int *= -1 int
execute store result storage ckr_utils:io z_min double 0.0001 run scoreboard players operation temp_z_min int *= -1 int

# 计算执行坐标
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get z int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function ckr_utils:pool_area/build/barrier with storage ckr_utils:io {}

# 区块安全
tp @s 0 0 0