#ckr_utils:constructors/vehicle_setup/init_func
# ckr_utils:constructors/vehicle_setup/_iter调用

scoreboard players add temp_cnt_v int 1
tag @s add ckr_vehicle_inited

function marker_control:data/_get
# 重生点数据
data modify storage marker_control:io result.respawn_pos set value [0.0d,0.0d,0.0d]
scoreboard players operation tempid int = strips_cnt int
scoreboard players remove tempid int 1
execute as @e[tag=ckr_utils_strip_area] if score @s index = tempid int run tag @s add tmp
execute as @e[tag=tmp,limit=1] store result storage marker_control:io result.respawn_pos[0] double 0.0001 run scoreboard players get @s respawn_x
execute as @e[tag=tmp,limit=1] store result storage marker_control:io result.respawn_pos[1] double 0.0001 run scoreboard players get @s respawn_y
execute as @e[tag=tmp,limit=1] store result storage marker_control:io result.respawn_pos[2] double 0.0001 run scoreboard players get @s respawn_z
tag @e[tag=tmp] remove tmp
# 已过检查点数据
data modify storage marker_control:io result.last_index set value 0
# 已过圈数
data modify storage marker_control:io result.laps set value 0
function marker_control:data/_store