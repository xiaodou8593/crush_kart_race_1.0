#ckr_utils:constructors/spawn_planes/_store
# 临时对象赋值到实体对象
# 输入执行实体

scoreboard players operation @s vp_progress = vp_progress int
data modify entity @s data.list_planes set from storage ckr_utils:io list_planes
scoreboard players operation @s planes_cnt = planes_cnt int
data modify entity @s data.field_center set from storage vp_core:io field_center