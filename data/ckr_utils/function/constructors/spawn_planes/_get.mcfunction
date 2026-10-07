#ckr_utils:constructors/spawn_planes/_get
# 实体对象赋值到临时对象
# 输入执行实体

scoreboard players operation vp_progress int = @s vp_progress
data modify storage ckr_utils:io list_planes set from entity @s data.list_planes
scoreboard players operation planes_cnt int = @s planes_cnt
data modify storage vp_core:io field_center set from entity @s data.field_center