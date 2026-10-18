#ckr_utils:constructors/spawn_strips/_zero
# 把临时对象的全部数据置0

scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_strips set value 0b
data modify storage vp_core:io field_center set value [0.0d, 0.0d, 0.0d]
scoreboard players set strips_cnt int 0