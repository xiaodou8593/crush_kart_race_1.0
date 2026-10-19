#ckr_utils:constructors/spawn_vehicles/_store
# 临时对象赋值到实体对象
# 输入执行实体

scoreboard players operation @s vp_progress = vp_progress int
data modify entity @s data.list_uuids set from storage ckr_utils:io list_uuids
scoreboard players operation @s vehicles_cnt = vehicles_cnt int
data modify entity @s data.field_center set from storage vp_core:io field_center
scoreboard players operation @s d = d int
scoreboard players operation @s l = l int
scoreboard players operation @s x = x int
scoreboard players operation @s y = y int
scoreboard players operation @s z = z int
scoreboard players operation @s ivec_x = ivec_x int
scoreboard players operation @s ivec_y = ivec_y int
scoreboard players operation @s ivec_z = ivec_z int
scoreboard players operation @s jvec_x = jvec_x int
scoreboard players operation @s jvec_y = jvec_y int
scoreboard players operation @s jvec_z = jvec_z int
scoreboard players operation @s kvec_x = kvec_x int
scoreboard players operation @s kvec_y = kvec_y int
scoreboard players operation @s kvec_z = kvec_z int
scoreboard players operation @s quat_x = quat_x int
scoreboard players operation @s quat_y = quat_y int
scoreboard players operation @s quat_z = quat_z int
scoreboard players operation @s quat_w = quat_w int
scoreboard players operation @s quat_start_x = quat_start_x int
scoreboard players operation @s quat_start_y = quat_start_y int
scoreboard players operation @s quat_start_z = quat_start_z int
scoreboard players operation @s quat_start_w = quat_start_w int
scoreboard players operation @s quat_orth_x = quat_orth_x int
scoreboard players operation @s quat_orth_y = quat_orth_y int
scoreboard players operation @s quat_orth_z = quat_orth_z int
scoreboard players operation @s quat_orth_w = quat_orth_w int
scoreboard players operation @s quat_phi = quat_phi int