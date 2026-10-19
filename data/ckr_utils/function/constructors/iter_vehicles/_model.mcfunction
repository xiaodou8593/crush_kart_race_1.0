#ckr_utils:constructors/iter_vehicles/_model
# 使用临时对象构建数据模板
# 输出数据模板storage ckr_utils:io result

data modify storage ckr_utils:io result.vp_progress set value 0

execute store result storage ckr_utils:io result.vp_progress int 1 run scoreboard players get vp_progress int