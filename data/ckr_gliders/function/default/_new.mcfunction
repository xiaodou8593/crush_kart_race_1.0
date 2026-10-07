#ckr_gliders:default/_new
# 使用数据模板生成实体对象
# 输入数据模板storage ckr_gliders:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon item_display ~ ~ ~ {Tags:["ckr_gliders_default", "result"],CustomName:"ckr_gliders_default"}
execute as @e[tag=result,limit=1] run function ckr_gliders:default/set
execute as @e[tag=result,limit=1] run function ckr_gliders:default/set_operation