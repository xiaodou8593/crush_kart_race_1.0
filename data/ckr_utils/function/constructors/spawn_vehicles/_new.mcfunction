#ckr_utils:constructors/spawn_vehicles/_new
# 使用数据模板生成spawn_vehicles实例
# 输入数据模板storage ckr_utils:io input
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["vp_constructor", "spawn_vehicles", "result"], CustomName:"spawn_vehicles"}
execute as @e[tag=result,limit=1] run function ckr_utils:constructors/spawn_vehicles/set