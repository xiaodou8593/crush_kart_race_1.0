#ckr_utils:constructors/spawn_slopes/_zero
# 把临时对象的全部数据置0

scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_slopes set value []
data modify storage vp_core:io field_center set value [0.0d, 0.0d, 0.0d]
scoreboard players set slopes_cnt int 0