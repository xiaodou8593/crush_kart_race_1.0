#ckr_utils:constructors/spawn_strips/set
# ckr_utils:constructors/spawn_strips/_new调用

execute store result score @s vp_progress run data get storage ckr_utils:io input.vp_progress
data modify entity @s data.list_strips set from storage ckr_utils:io input.list_strips
execute store result score @s strips_cnt run data get storage ckr_utils:io input.strips_cnt
data modify entity @s data.field_center set from storage ckr_utils:io input.field_center

# 获取模块编号
scoreboard players operation @s module_id = #ckr_utils:constructors/spawn_strips/ module_id