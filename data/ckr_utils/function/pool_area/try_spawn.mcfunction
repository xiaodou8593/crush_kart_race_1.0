#ckr_utils:pool_area/try_spawn
# ckr_utils:pool_area/main调用

# 计算dxdz参数
scoreboard players operation temp_dx int = d int
scoreboard players operation temp_dz int = l int
scoreboard players operation temp_dx int *= 2 int
scoreboard players operation temp_dz int *= 2 int
scoreboard players add temp_dx int 9999
scoreboard players add temp_dz int 9999
execute store result storage ckr_utils:io dx int 1 run scoreboard players operation temp_dx int /= 10000 int
execute store result storage ckr_utils:io dz int 1 run scoreboard players operation temp_dz int /= 10000 int

# 计算执行坐标
scoreboard players operation temp_x int = x int
scoreboard players operation temp_y int = y int
scoreboard players operation temp_z int = z int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation temp_x int -= d int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players remove temp_y int 100000
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation temp_z int -= l int
data modify entity @s Pos set from storage math:io xyz

# 统计区域内实体数量
execute at @s run function ckr_utils:pool_area/try_spawn_cnt with storage ckr_utils:io {}

# 生成失败
execute if score res int >= spawn_max int run return run tp @s 0 0 0

# 生成怪物
function ckr_utils:pool_area/_spawn_a_mob