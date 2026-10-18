#ckr_utils:strip_area/init_operation
# ckr_utils:strip_area/init调用

# 辅助记分板
scoreboard objectives add ckr_utils_strip_area_info dummy

# 默认不注册模块
#return fail

# 初始化模块控制
scoreboard objectives add int dummy
execute unless score module_control_inited int matches 1 run function module_control:_init

# 注册本模块
data modify storage module_control:io input set value {prefix:"ckr_utils:strip_area/",namespace:"ckr_utils"}
function module_control:data/_reg
scoreboard players operation #ckr_utils:strip_area/ module_id = res int

# 实例获得以下命令
# scoreboard players operation @s module_id = #ckr_utils:strip_area/ module_id