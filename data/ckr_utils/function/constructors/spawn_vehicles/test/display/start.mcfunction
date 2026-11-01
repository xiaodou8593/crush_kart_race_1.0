#ckr_utils:constructors/spawn_vehicles/test/display/start

# 生成测试程序实体
scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_uuids set value []
#data modify storage ckr_utils:io list_uuids append from entity @p UUID
#data modify storage ckr_utils:io list_uuids append from entity @e[tag=math_marker,limit=1] UUID
#data modify storage ckr_utils:io list_uuids append from entity @e[tag=math_marker,limit=1] UUID
#data modify storage ckr_utils:io list_uuids append from entity @e[tag=math_marker,limit=1] UUID
execute store result score vehicles_cnt int run data get storage ckr_utils:io list_uuids
scoreboard players set d int 3
scoreboard players set l int 3
execute positioned -56.0 -34 185 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function ckr_utils:constructors/spawn_vehicles/_anchor_to
function ckr_utils:constructors/spawn_vehicles/_model
#tellraw @a ["result: ", {"nbt":"result","storage":"ckr_utils:io"}]
data modify storage ckr_utils:io input set from storage ckr_utils:io result
execute positioned 0.0 0.0 0.0 run function ckr_utils:constructors/spawn_vehicles/_new
tag @e[tag=result,limit=1] add test

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "ckr_utils:constructors/spawn_vehicles/test/display/main"
data modify storage marker_control:io result.del_func set value "ckr_utils:constructors/spawn_vehicles/test/display/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20

scoreboard players set test int -1
scoreboard players set test_n int 0

data modify storage ckr_utils:io test_frames set value {}