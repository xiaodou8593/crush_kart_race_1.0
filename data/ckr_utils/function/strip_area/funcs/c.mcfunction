#ckr_utils:strp_area/funcs/c
# 检查点回调函数

function marker_control:data/_get
execute store result score temp_index int run data get storage marker_control:io result.last_index
scoreboard players operation temp_mod int = index int
scoreboard players operation temp_mod int -= temp_index int
scoreboard players operation temp_mod int %= strips_cnt int
execute if score temp_mod int matches 0 run scoreboard players operation temp_mod int = strips_cnt int
scoreboard players operation temp_mod int *= 2 int
scoreboard players operation temp_mod int -= strips_cnt int
# 过滤倒圈情况
execute if score temp_mod int matches 1.. run return fail

# 设重生点
execute store result storage marker_control:io result.respawn_pos[0] double 0.0001 run scoreboard players get respawn_x int
execute store result storage marker_control:io result.respawn_pos[1] double 0.0001 run scoreboard players get respawn_y int
execute store result storage marker_control:io result.respawn_pos[2] double 0.0001 run scoreboard players get respawn_z int
# 经过当前检查点
execute store result storage marker_control:io result.last_index int 1 run scoreboard players get index int

function marker_control:data/_store

execute on passengers on passengers run title @s title "在空中按下Ctrl关闭滑翔伞"
execute at @s run playsound minecraft:block.note_block.pling player @a ~ ~ ~ 1.5