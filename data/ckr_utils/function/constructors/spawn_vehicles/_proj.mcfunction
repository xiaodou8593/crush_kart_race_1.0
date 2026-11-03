#ckr_utils:constructors/spawn_vehicles/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage ckr_utils:io input

execute store result score vp_progress int run data get storage ckr_utils:io input.vp_progress
data modify storage ckr_utils:io list_uuids set from storage ckr_utils:io input.list_uuids
execute store result score vehicles_cnt int run data get storage ckr_utils:io input.vehicles_cnt
execute store result score d int run data get storage ckr_utils:io input.range[0]
execute store result score l int run data get storage ckr_utils:io input.range[1]
execute store result score x int run data get storage ckr_utils:io input.center[0] 10000
execute store result score y int run data get storage ckr_utils:io input.center[1] 10000
execute store result score z int run data get storage ckr_utils:io input.center[2] 10000
execute store result score ivec_x int run data get storage ckr_utils:io input.ivec[0] 10000
execute store result score ivec_y int run data get storage ckr_utils:io input.ivec[1] 10000
execute store result score ivec_z int run data get storage ckr_utils:io input.ivec[2] 10000
execute store result score jvec_x int run data get storage ckr_utils:io input.jvec[0] 10000
execute store result score jvec_y int run data get storage ckr_utils:io input.jvec[1] 10000
execute store result score jvec_z int run data get storage ckr_utils:io input.jvec[2] 10000
execute store result score kvec_x int run data get storage ckr_utils:io input.kvec[0] 10000
execute store result score kvec_y int run data get storage ckr_utils:io input.kvec[1] 10000
execute store result score kvec_z int run data get storage ckr_utils:io input.kvec[2] 10000
execute store result score quat_x int run data get storage ckr_utils:io input.xyzw[0] 10000
execute store result score quat_y int run data get storage ckr_utils:io input.xyzw[1] 10000
execute store result score quat_z int run data get storage ckr_utils:io input.xyzw[2] 10000
execute store result score quat_w int run data get storage ckr_utils:io input.xyzw[3] 10000
execute store result score quat_start_x int run data get storage ckr_utils:io input.start_xyzw[0] 10000
execute store result score quat_start_y int run data get storage ckr_utils:io input.start_xyzw[1] 10000
execute store result score quat_start_z int run data get storage ckr_utils:io input.start_xyzw[2] 10000
execute store result score quat_start_w int run data get storage ckr_utils:io input.start_xyzw[3] 10000
execute store result score quat_orth_x int run data get storage ckr_utils:io input.orth_xyzw[0] 10000
execute store result score quat_orth_y int run data get storage ckr_utils:io input.orth_xyzw[1] 10000
execute store result score quat_orth_z int run data get storage ckr_utils:io input.orth_xyzw[2] 10000
execute store result score quat_orth_w int run data get storage ckr_utils:io input.orth_xyzw[3] 10000
execute store result score quat_phi int run data get storage ckr_utils:io input.quat_phi 10000