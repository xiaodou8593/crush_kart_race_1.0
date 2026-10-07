#ckr_utils:constructors/spawn_planes/_new
# 使用数据模板生成spawn_planes实例
# 输入数据模板storage ckr_utils:io input
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["vp_constructor", "spawn_planes", "result"], CustomName:"spawn_planes"}
execute as @e[tag=result,limit=1] run function ckr_utils:constructors/spawn_planes/set