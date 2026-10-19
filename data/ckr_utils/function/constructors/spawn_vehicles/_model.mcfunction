#ckr_utils:constructors/spawn_vehicles/_model
# 使用临时对象构建数据模板
# 输出数据模板storage ckr_utils:io result

data modify storage ckr_utils:io result set value {vp_progress:0, list_uuids:[], vehicles_cnt:0, field_center:[0.0d, 0.0d, 0.0d], range:[0.0d, 0.0d], center:[0.0d, 0.0d, 0.0d], ivec:[0.0d, 0.0d, 0.0d], jvec:[0.0d, 0.0d, 0.0d], kvec:[0.0d, 0.0d, 0.0d], xyzw:[0.0d, 0.0d, 0.0d, 0.0d], start_xyzw:[0.0d, 0.0d, 0.0d, 0.0d], orth_xyzw:[0.0d, 0.0d, 0.0d, 0.0d], quat_phi:0}

execute store result storage ckr_utils:io result.vp_progress int 1 run scoreboard players get vp_progress int
data modify storage ckr_utils:io result.list_uuids set from storage ckr_utils:io list_uuids
execute store result storage ckr_utils:io result.vehicles_cnt int 1 run scoreboard players get vehicles_cnt int
data modify storage ckr_utils:io result.field_center set from storage vp_core:io field_center
execute store result storage ckr_utils:io result.range[0] double 1 run scoreboard players get d int
execute store result storage ckr_utils:io result.range[1] double 1 run scoreboard players get l int
execute store result storage ckr_utils:io result.center[0] double 0.0001 run scoreboard players get x int
execute store result storage ckr_utils:io result.center[1] double 0.0001 run scoreboard players get y int
execute store result storage ckr_utils:io result.center[2] double 0.0001 run scoreboard players get z int
execute store result storage ckr_utils:io result.ivec[0] double 0.0001 run scoreboard players get ivec_x int
execute store result storage ckr_utils:io result.ivec[1] double 0.0001 run scoreboard players get ivec_y int
execute store result storage ckr_utils:io result.ivec[2] double 0.0001 run scoreboard players get ivec_z int
execute store result storage ckr_utils:io result.jvec[0] double 0.0001 run scoreboard players get jvec_x int
execute store result storage ckr_utils:io result.jvec[1] double 0.0001 run scoreboard players get jvec_y int
execute store result storage ckr_utils:io result.jvec[2] double 0.0001 run scoreboard players get jvec_z int
execute store result storage ckr_utils:io result.kvec[0] double 0.0001 run scoreboard players get kvec_x int
execute store result storage ckr_utils:io result.kvec[1] double 0.0001 run scoreboard players get kvec_y int
execute store result storage ckr_utils:io result.kvec[2] double 0.0001 run scoreboard players get kvec_z int
execute store result storage ckr_utils:io result.xyzw[0] double 0.0001 run scoreboard players get quat_x int
execute store result storage ckr_utils:io result.xyzw[1] double 0.0001 run scoreboard players get quat_y int
execute store result storage ckr_utils:io result.xyzw[2] double 0.0001 run scoreboard players get quat_z int
execute store result storage ckr_utils:io result.xyzw[3] double 0.0001 run scoreboard players get quat_w int
execute store result storage ckr_utils:io result.start_xyzw[0] double 0.0001 run scoreboard players get quat_start_x int
execute store result storage ckr_utils:io result.start_xyzw[1] double 0.0001 run scoreboard players get quat_start_y int
execute store result storage ckr_utils:io result.start_xyzw[2] double 0.0001 run scoreboard players get quat_start_z int
execute store result storage ckr_utils:io result.start_xyzw[3] double 0.0001 run scoreboard players get quat_start_w int
execute store result storage ckr_utils:io result.orth_xyzw[0] double 0.0001 run scoreboard players get quat_orth_x int
execute store result storage ckr_utils:io result.orth_xyzw[1] double 0.0001 run scoreboard players get quat_orth_y int
execute store result storage ckr_utils:io result.orth_xyzw[2] double 0.0001 run scoreboard players get quat_orth_z int
execute store result storage ckr_utils:io result.orth_xyzw[3] double 0.0001 run scoreboard players get quat_orth_w int
execute store result storage ckr_utils:io result.quat_phi int 0.0001 run scoreboard players get quat_phi int