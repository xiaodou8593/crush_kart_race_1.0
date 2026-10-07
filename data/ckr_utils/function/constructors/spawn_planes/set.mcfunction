#ckr_utils:constructors/spawn_planes/set
# ckr_utils:constructors/spawn_planes/_new调用

execute store result score @s vp_progress run data get storage ckr_utils:io input.vp_progress
data modify entity @s data.list_planes set from storage ckr_utils:io input.list_planes
execute store result score @s planes_cnt run data get storage ckr_utils:io input.planes_cnt
data modify entity @s data.field_center set from storage ckr_utils:io input.field_center

# 获取模块编号
scoreboard players operation @s module_id = #ckr_utils:constructors/spawn_planes/ module_id