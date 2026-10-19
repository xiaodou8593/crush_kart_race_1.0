#ckr_utils:constructors/iter_vehicles/set
# ckr_utils:constructors/iter_vehicles/_new调用

execute store result score @s vp_progress run data get storage ckr_utils:io input.vp_progress

# 获取模块编号
scoreboard players operation @s module_id = #ckr_utils:constructors/iter_vehicles/ module_id