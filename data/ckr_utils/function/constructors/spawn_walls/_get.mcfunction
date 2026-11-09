#ckr_utils:constructors/spawn_walls/_get
# 实体对象赋值到临时对象
# 输入执行实体

scoreboard players operation vp_progress int = @s vp_progress
data modify storage ckr_utils:io list_walls set from entity @s data.list_walls
scoreboard players operation walls_cnt int = @s walls_cnt
data modify storage vp_core:io field_center set from entity @s data.field_center