#ckr_utils:pool_area/init_operation
# ckr_utils:pool_area/init调用

# vp_modular计数器
scoreboard players set #ckr_utils:pool_area/ vp_modular 0

# 随机序列
random reset ckr_utils:pool_rand 0 false true
# 获取随机数: random value 0..2147483646 ckr_utils:pool_rand

# 默认不注册模块
return fail

# 初始化模块控制
scoreboard objectives add int dummy
execute unless score module_control_inited int matches 1 run function module_control:_init

# 注册本模块
data modify storage module_control:io input set value {prefix:"ckr_utils:pool_area/",namespace:"ckr_utils"}
function module_control:data/_reg
scoreboard players operation #ckr_utils:pool_area/ module_id = res int

# 实例获得以下命令
# scoreboard players operation @s module_id = #ckr_utils:pool_area/ module_id