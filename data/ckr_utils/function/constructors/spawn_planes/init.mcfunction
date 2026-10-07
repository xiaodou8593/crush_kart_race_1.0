#ckr_utils:constructors/spawn_planes/init
# 初始化spawn_planes模块

# 初始化模块控制
scoreboard objectives add int dummy
execute unless score module_control_inited int matches 1 run function module_control:_init

# 注册本模块
data modify storage module_control:io input set value {prefix:"ckr_utils:constructors/spawn_planes/",namespace:"ckr_utils"}
function module_control:data/_reg
scoreboard players operation #ckr_utils:constructors/spawn_planes/ module_id = res int

data modify storage ckr_utils:io list_planes set value 0b
data modify storage vp_core:io field_center set value [0.0d, 0.0d, 0.0d]

scoreboard objectives add vp_progress dummy
scoreboard objectives add planes_cnt dummy

function ckr_utils:constructors/spawn_planes/_class