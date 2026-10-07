#ckr_utils:constructors/spawn_slopes/set
# ckr_utils:constructors/spawn_slopes/_new调用

execute store result score @s vp_progress run data get storage ckr_utils:io input.vp_progress
data modify entity @s data.list_slopes set from storage ckr_utils:io input.list_slopes
execute store result score @s slopes_cnt run data get storage ckr_utils:io input.slopes_cnt
data modify entity @s data.field_center set from storage ckr_utils:io input.field_center

# 获取模块编号
scoreboard players operation @s module_id = #ckr_utils:constructors/spawn_slopes/ module_id