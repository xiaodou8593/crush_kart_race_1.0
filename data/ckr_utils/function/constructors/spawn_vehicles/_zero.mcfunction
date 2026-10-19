#ckr_utils:constructors/spawn_vehicles/_zero
# 把临时对象的全部数据置0

scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_uuids set value []
data modify storage vp_core:io field_center set value [0.0d, 0.0d, 0.0d]
scoreboard players set vehicles_cnt int 0
scoreboard players set d int 0
scoreboard players set l int 0
scoreboard players set x int 0
scoreboard players set y int 0
scoreboard players set z int 0
scoreboard players set ivec_x int 0
scoreboard players set ivec_y int 0
scoreboard players set ivec_z int 0
scoreboard players set jvec_x int 0
scoreboard players set jvec_y int 0
scoreboard players set jvec_z int 0
scoreboard players set kvec_x int 0
scoreboard players set kvec_y int 0
scoreboard players set kvec_z int 0
scoreboard players set quat_x int 0
scoreboard players set quat_y int 0
scoreboard players set quat_z int 0
scoreboard players set quat_w int 0
scoreboard players set quat_start_x int 0
scoreboard players set quat_start_y int 0
scoreboard players set quat_start_z int 0
scoreboard players set quat_start_w int 0
scoreboard players set quat_orth_x int 0
scoreboard players set quat_orth_y int 0
scoreboard players set quat_orth_z int 0
scoreboard players set quat_orth_w int 0
scoreboard players set quat_phi int 0