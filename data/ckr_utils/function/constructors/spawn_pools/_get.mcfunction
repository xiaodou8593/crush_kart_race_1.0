#ckr_utils:constructors/spawn_pools/_get
# 实体对象赋值到临时对象
# 输入执行实体

scoreboard players operation vp_progress int = @s vp_progress
data modify storage ckr_utils:io list_pools set from entity @s data.list_pools
scoreboard players operation pools_cnt int = @s pools_cnt
data modify storage vp_core:io field_center set from entity @s data.field_center