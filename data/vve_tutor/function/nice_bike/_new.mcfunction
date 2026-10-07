#vve_tutor:nice_bike/_new
# 使用数据模板生成实体对象
# 输入数据模板storage vve_tutor:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon item_display ~ ~ ~ {Tags:["vve_tutor_nice_bike","result"],CustomName:"vve_tutor_nice_bike",item_display:"fixed",teleport_duration:1,interpolation_duration:1,brightness:{sky:15,block:15},Passengers:[{id:"minecraft:interaction",Tags:["vve_tutor_nice_bike_interaction"]}]}
execute as @e[tag=result,limit=1] run function vve_tutor:nice_bike/set
execute as @e[tag=result,limit=1] run function vve_tutor:nice_bike/set_operation