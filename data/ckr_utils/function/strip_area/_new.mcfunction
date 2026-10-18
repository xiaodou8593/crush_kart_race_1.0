#ckr_utils:strip_area/_new
# 使用数据模板生成实体对象
# 输入数据模板storage ckr_utils:io input
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon marker 0 8 0 {Tags:["ckr_utils_strip_area", "result"],CustomName:"ckr_utils_strip_area"}
execute as @e[tag=result,limit=1] run function ckr_utils:strip_area/set
execute as @e[tag=result,limit=1] run function ckr_utils:strip_area/set_operation