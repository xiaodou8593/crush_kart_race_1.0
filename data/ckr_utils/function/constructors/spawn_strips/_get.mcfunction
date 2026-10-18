#ckr_utils:constructors/spawn_strips/_get
# 实体对象赋值到临时对象
# 输入执行实体

scoreboard players operation vp_progress int = @s vp_progress
data modify storage ckr_utils:io list_strips set from entity @s data.list_strips
scoreboard players operation strips_cnt int = @s strips_cnt
data modify storage vp_core:io field_center set from entity @s data.field_center