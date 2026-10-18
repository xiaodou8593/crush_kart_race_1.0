#ckr_utils:constructors/spawn_strips/_model
# 使用临时对象构建数据模板
# 输出数据模板storage ckr_utils:io result

data modify storage ckr_utils:io result set value {vp_progress:0, list_strips:0b, strips_cnt:0, field_center:[0.0d, 0.0d, 0.0d]}

execute store result storage ckr_utils:io result.vp_progress int 1 run scoreboard players get vp_progress int
data modify storage ckr_utils:io result.list_strips set from storage ckr_utils:io list_strips
execute store result storage ckr_utils:io result.strips_cnt int 1 run scoreboard players get strips_cnt int
data modify storage ckr_utils:io result.field_center set from storage vp_core:io field_center