#ckr_utils:constructors/spawn_vehicles/set
# ckr_utils:constructors/spawn_vehicles/_new调用

execute store result score @s vp_progress run data get storage ckr_utils:io input.vp_progress
data modify entity @s data.list_uuids set from storage ckr_utils:io input.list_uuids
execute store result score @s vehicles_cnt run data get storage ckr_utils:io input.vehicles_cnt
data modify entity @s data.field_center set from storage ckr_utils:io input.field_center
execute store result score @s d run data get storage ckr_utils:io input.range[0]
execute store result score @s l run data get storage ckr_utils:io input.range[1]
execute store result score @s x run data get storage ckr_utils:io input.center[0] 10000
execute store result score @s y run data get storage ckr_utils:io input.center[1] 10000
execute store result score @s z run data get storage ckr_utils:io input.center[2] 10000
execute store result score @s ivec_x run data get storage ckr_utils:io input.ivec[0] 10000
execute store result score @s ivec_y run data get storage ckr_utils:io input.ivec[1] 10000
execute store result score @s ivec_z run data get storage ckr_utils:io input.ivec[2] 10000
execute store result score @s jvec_x run data get storage ckr_utils:io input.jvec[0] 10000
execute store result score @s jvec_y run data get storage ckr_utils:io input.jvec[1] 10000
execute store result score @s jvec_z run data get storage ckr_utils:io input.jvec[2] 10000
execute store result score @s kvec_x run data get storage ckr_utils:io input.kvec[0] 10000
execute store result score @s kvec_y run data get storage ckr_utils:io input.kvec[1] 10000
execute store result score @s kvec_z run data get storage ckr_utils:io input.kvec[2] 10000
execute store result score @s quat_x run data get storage ckr_utils:io input.xyzw[0] 10000
execute store result score @s quat_y run data get storage ckr_utils:io input.xyzw[1] 10000
execute store result score @s quat_z run data get storage ckr_utils:io input.xyzw[2] 10000
execute store result score @s quat_w run data get storage ckr_utils:io input.xyzw[3] 10000
execute store result score @s quat_start_x run data get storage ckr_utils:io input.start_xyzw[0] 10000
execute store result score @s quat_start_y run data get storage ckr_utils:io input.start_xyzw[1] 10000
execute store result score @s quat_start_z run data get storage ckr_utils:io input.start_xyzw[2] 10000
execute store result score @s quat_start_w run data get storage ckr_utils:io input.start_xyzw[3] 10000
execute store result score @s quat_orth_x run data get storage ckr_utils:io input.orth_xyzw[0] 10000
execute store result score @s quat_orth_y run data get storage ckr_utils:io input.orth_xyzw[1] 10000
execute store result score @s quat_orth_z run data get storage ckr_utils:io input.orth_xyzw[2] 10000
execute store result score @s quat_orth_w run data get storage ckr_utils:io input.orth_xyzw[3] 10000
execute store result score @s quat_phi run data get storage ckr_utils:io input.quat_phi 10000

# 获取模块编号
scoreboard players operation @s module_id = #ckr_utils:constructors/spawn_vehicles/ module_id