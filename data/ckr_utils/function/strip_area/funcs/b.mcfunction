#ckr_utils:strp_area/funcs/b
# 检查点回调函数

function marker_control:data/_get
execute store result score temp_index int run data get storage marker_control:io result.last_index
scoreboard players operation temp_mod int = index int
scoreboard players operation temp_mod int -= temp_index int
execute store result score temp_d int run scoreboard players operation temp_mod int %= strips_cnt int
execute if score temp_mod int matches 0 run scoreboard players operation temp_mod int = strips_cnt int
scoreboard players operation temp_mod int *= 2 int
scoreboard players operation temp_mod int -= strips_cnt int
# 过滤倒圈情况
execute if score temp_mod int matches 1.. run return fail

# 到标号n-1检查点的距离
scoreboard players operation temp_e int = strips_cnt int
scoreboard players remove temp_e int 1
scoreboard players operation temp_e int -= temp_index int
scoreboard players operation temp_e int %= strips_cnt int

# 设重生点
execute store result storage marker_control:io result.respawn_pos[0] double 0.0001 run scoreboard players get respawn_x int
execute store result storage marker_control:io result.respawn_pos[1] double 0.0001 run scoreboard players get respawn_y int
execute store result storage marker_control:io result.respawn_pos[2] double 0.0001 run scoreboard players get respawn_z int
# 经过当前检查点
execute store result storage marker_control:io result.last_index int 1 run scoreboard players get index int

# 增加圈数
execute store result score temp_cnt int run data get storage marker_control:io result.laps
execute if score temp_e int > 0 int if score temp_e int <= temp_d int store result storage marker_control:io result.laps int 1 run scoreboard players add temp_cnt int 1

function marker_control:data/_store

execute on passengers on passengers run title @s title ""
execute on passengers on passengers run title @s subtitle "在空中按下Space打开滑翔伞"
execute at @s run playsound minecraft:block.note_block.pling player @a ~ ~ ~ 1.5