#ckr_utils:constructors/spawn_vehicles/test/display/spawn
# 聊天栏调用

execute as @e[tag=spawn_vehicles,tag=test,limit=1] run function ckr_utils:constructors/spawn_vehicles/_get
function ckr_utils:constructors/spawn_vehicles/_start
function ckr_utils:constructors/spawn_vehicles/_iter_all
tag @e[tag=vp_instance] remove vp_instance