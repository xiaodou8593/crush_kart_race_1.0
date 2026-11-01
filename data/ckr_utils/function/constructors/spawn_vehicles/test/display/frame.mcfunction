#ckr_utils:constructors/spawn_vehicles/test/display/frame

tellraw @a "---"
tellraw @a "frame: (frame)"
data modify storage vve_examples:io input set from storage vve_examples:io test_frames.(frame)
function ckr_utils:constructors/spawn_vehicles/_new
execute as @e[tag=result,limit=1] run function marker_control:data/_get
# 设置销毁函数
data modify storage marker_control:io result.del_func set value "ckr_utils:constructors/spawn_vehicles/_del"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_todel
scoreboard players set @e[tag=result,limit=1] killtime 50
execute as @e[tag=result,limit=1] run function ckr_utils:constructors/spawn_vehicles/main