#ckr_utils:pool_area/_spawn_a_mob
# 生成一只怪物
# 占用math:vec{...}
# 占用storage ckr_mobs:io input
# 占用storage ckr_utils:io index
# 传入世界实体为执行者

# 迭代随机数，获取随机x坐标
scoreboard players operation stemp_max int = d int
scoreboard players operation stemp_max int *= 2 int
execute store result score vec_x int run random value 0..2147483646 ckr_utils:pool_rand
scoreboard players operation vec_x int %= stemp_max int
scoreboard players operation vec_x int -= d int
scoreboard players operation vec_x int += x int

scoreboard players operation vec_y int = y int
scoreboard players add vec_y int 10000

# 迭代随机数，获取随机z坐标
scoreboard players operation stemp_max int = l int
scoreboard players operation stemp_max int *= 2 int
execute store result score vec_z int run random value 0..2147483646 ckr_utils:pool_rand
scoreboard players operation vec_z int %= stemp_max int
scoreboard players operation vec_z int -= l int
scoreboard players operation vec_z int += z int

# 随机抽取模板
execute store result score stemp_max int run data get storage ckr_utils:io spawn_plates
execute store result score loop int run random value 0..2147483646 ckr_utils:pool_rand
execute store result storage ckr_utils:io index int 1 run scoreboard players operation loop int %= stemp_max int
function ckr_utils:pool_area/pull_spawn_plate with storage ckr_utils:io {}

function ckr_utils:pool_area/_push
# 使用模板生成
execute store result storage ckr_mobs:io input.center[0] double 0.0001 run scoreboard players get vec_x int
execute store result storage ckr_mobs:io input.center[1] double 0.0001 run scoreboard players get vec_y int
execute store result storage ckr_mobs:io input.center[2] double 0.0001 run scoreboard players get vec_z int
data modify entity @s Pos set from storage ckr_mobs:io input.center
execute at @s run function ckr_utils:pool_area/use_spawn_plate with storage ckr_mobs:io input
function ckr_utils:pool_area/_pop

# 区块安全
tp @s 0 0 0