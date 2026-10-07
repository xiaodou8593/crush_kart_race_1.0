#ckr_utils:constructors/spawn_slopes/_new
# 使用数据模板生成spawn_slopes实例
# 输入数据模板storage ckr_utils:io input
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["vp_constructor", "spawn_slopes", "result"], CustomName:"spawn_slopes"}
execute as @e[tag=result,limit=1] run function ckr_utils:constructors/spawn_slopes/set