#ckr_utils:wall_area/_delete_display
# 删除展示设置
# 传入世界实体为执行者

# 计算偏移向量
scoreboard players operation temp_abs_x int = nvec_x int
execute if score temp_abs_x int matches ..-1 run scoreboard players operation temp_abs_x int *= -1 int
scoreboard players operation temp_abs_z int = nvec_z int
execute if score temp_abs_z int matches ..-1 run scoreboard players operation temp_abs_z int *= -1 int
execute if score temp_abs_x int matches 10000 run data modify storage ckr_utils:io temp_s set value "~ ~ ~1"
execute if score temp_abs_z int matches 10000 run data modify storage ckr_utils:io temp_s set value "~1 ~ ~"

# 计算偏移格数
scoreboard players operation temp_cnt int = x int
execute if score temp_abs_x int matches 10000 run scoreboard players operation temp_cnt int = z int
scoreboard players operation temp_cnt int -= d int
scoreboard players operation temp_cnt int %= 10000 int
scoreboard players operation temp_cnt int += d int
scoreboard players operation temp_cnt int += d int
scoreboard players operation temp_cnt int /= 10000 int
scoreboard players add temp_cnt int 1

# 计算y轴范围
execute store result storage ckr_utils:io y_min double -0.0001 run scoreboard players get h int
execute store result storage ckr_utils:io y_max double 0.0001 run scoreboard players get h int

# 计算第一层屏障起始点
scoreboard players operation temp_x int = x int
scoreboard players operation temp_z int = z int
scoreboard players operation temp_x int += nvec_x int
scoreboard players operation temp_z int += nvec_z int
execute if score temp_abs_x int matches 10000 run scoreboard players operation temp_z int -= d int
execute if score temp_abs_z int matches 10000 run scoreboard players operation temp_x int -= d int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get temp_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get temp_z int
data modify entity @s Pos set from storage math:io xyz
scoreboard players operation loop int = temp_cnt int
execute at @s run function ckr_utils:wall_area/build/loop_air with storage ckr_utils:io {}

# 计算第二层屏障起始点
scoreboard players operation temp_x int = x int
scoreboard players operation temp_z int = z int
execute if score temp_abs_x int matches 10000 run scoreboard players operation temp_z int -= d int
execute if score temp_abs_z int matches 10000 run scoreboard players operation temp_x int -= d int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get temp_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get temp_z int
data modify entity @s Pos set from storage math:io xyz
scoreboard players operation loop int = temp_cnt int
execute at @s run function ckr_utils:wall_area/build/loop_air with storage ckr_utils:io {}

# 计算第三层玻璃起始点
scoreboard players operation temp_x int = x int
scoreboard players operation temp_z int = z int
scoreboard players operation temp_x int -= nvec_x int
scoreboard players operation temp_z int -= nvec_z int
execute if score temp_abs_x int matches 10000 run scoreboard players operation temp_z int -= d int
execute if score temp_abs_z int matches 10000 run scoreboard players operation temp_x int -= d int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get temp_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get temp_z int
data modify entity @s Pos set from storage math:io xyz
scoreboard players operation loop int = temp_cnt int
execute at @s run function ckr_utils:wall_area/build/loop_air with storage ckr_utils:io {}

# 区块安全
tp @s 0 0 0