#ckr_utils:guis/track_edit/append_pool
# ckr_utils:guis/track_edit/save_button调用

scoreboard players set min int 2147483647
scoreboard players operation min int < @e[tag=ckr_utils_pool_area,tag=!tmp] int
execute as @e[tag=ckr_utils_pool_area,tag=!tmp] if score @s int = min int run tag @s add stmp
execute as @e[tag=stmp,limit=1] run function ckr_utils:pool_area/_get
# 应用场地偏移
execute store result score vec_x int run data get storage vp_core:io field_center[0] 10000
execute store result score vec_y int run data get storage vp_core:io field_center[1] 10000
execute store result score vec_z int run data get storage vp_core:io field_center[2] 10000
scoreboard players operation vec_x int *= -1 int
scoreboard players operation vec_y int *= -1 int
scoreboard players operation vec_z int *= -1 int
function ckr_utils:pool_area/_shift_vec
function ckr_utils:pool_area/_model
data modify storage ckr_utils:io temp.pool_plates append from storage ckr_utils:io result
tag @e[tag=stmp,limit=1] add tmp
tag @e[tag=stmp] remove stmp

execute if entity @e[tag=ckr_utils_pool_area,tag=!tmp,limit=1] run function ckr_utils:guis/track_edit/append_pool