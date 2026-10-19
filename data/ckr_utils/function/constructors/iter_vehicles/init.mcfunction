#ckr_utils:constructors/iter_vehicles/init
# 初始化iter_vehicles模块

# 初始化模块控制
scoreboard objectives add int dummy
execute unless score module_control_inited int matches 1 run function module_control:_init

# 注册本模块
data modify storage module_control:io input set value {prefix:"ckr_utils:constructors/iter_vehicles/",namespace:"ckr_utils"}
function module_control:data/_reg
scoreboard players operation #ckr_utils:constructors/iter_vehicles/ module_id = res int


scoreboard objectives add vp_progress dummy

function ckr_utils:constructors/iter_vehicles/_class