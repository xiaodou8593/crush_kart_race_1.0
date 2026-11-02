#ckr_utils:constructors/vehicle_setup/set
# ckr_utils:constructors/vehicle_setup/_new调用

execute store result score @s vp_progress run data get storage ckr_utils:io input.vp_progress

# 获取模块编号
scoreboard players operation @s module_id = #ckr_utils:constructors/vehicle_setup/ module_id