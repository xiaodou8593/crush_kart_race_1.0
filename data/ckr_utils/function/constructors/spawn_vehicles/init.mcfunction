#ckr_utils:constructors/spawn_vehicles/init
# 初始化spawn_vehicles模块

# 初始化模块控制
scoreboard objectives add int dummy
execute unless score module_control_inited int matches 1 run function module_control:_init

# 注册本模块
data modify storage module_control:io input set value {prefix:"ckr_utils:constructors/spawn_vehicles/",namespace:"ckr_utils"}
function module_control:data/_reg
scoreboard players operation #ckr_utils:constructors/spawn_vehicles/ module_id = res int

data modify storage ckr_utils:io list_uuids set value []
data modify storage vp_core:io field_center set value [0.0d, 0.0d, 0.0d]

scoreboard objectives add vp_progress dummy
scoreboard objectives add vehicles_cnt dummy
scoreboard objectives add d dummy
scoreboard objectives add l dummy
scoreboard objectives add ivec_x dummy
scoreboard objectives add ivec_y dummy
scoreboard objectives add ivec_z dummy
scoreboard objectives add jvec_x dummy
scoreboard objectives add jvec_y dummy
scoreboard objectives add jvec_z dummy
scoreboard objectives add kvec_x dummy
scoreboard objectives add kvec_y dummy
scoreboard objectives add kvec_z dummy
scoreboard objectives add quat_x dummy
scoreboard objectives add quat_y dummy
scoreboard objectives add quat_z dummy
scoreboard objectives add quat_w dummy
scoreboard objectives add quat_start_x dummy
scoreboard objectives add quat_start_y dummy
scoreboard objectives add quat_start_z dummy
scoreboard objectives add quat_start_w dummy
scoreboard objectives add quat_orth_x dummy
scoreboard objectives add quat_orth_y dummy
scoreboard objectives add quat_orth_z dummy
scoreboard objectives add quat_orth_w dummy
scoreboard objectives add quat_phi dummy

function ckr_utils:constructors/spawn_vehicles/_class