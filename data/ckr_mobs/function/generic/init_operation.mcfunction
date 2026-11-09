#ckr_mobs:generic/init_operation
# ckr_mobs:generic/init调用

# 金币随机序列
random reset ckr_mobs:coins_rand 0 false true
# 获取随机数: random value 0..2147483646 ckr_mobs:coins_rand

# 伤害随机序列
random reset ckr_mobs:damage_rand 0 false true
# 获取随机数: random value 0..2147483646 ckr_mobs:damage_rand

# 默认不注册模块
return fail

# 初始化模块控制
scoreboard objectives add int dummy
execute unless score module_control_inited int matches 1 run function module_control:_init

# 注册本模块
data modify storage module_control:io input set value {prefix:"ckr_mobs:generic/",namespace:"ckr_mobs"}
function module_control:data/_reg
scoreboard players operation #ckr_mobs:generic/ module_id = res int

# 实例获得以下命令
# scoreboard players operation @s module_id = #ckr_mobs:generic/ module_id