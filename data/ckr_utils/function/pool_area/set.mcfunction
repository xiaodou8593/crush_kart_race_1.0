#ckr_utils:pool_area/set
# ckr_utils:pool_area/_new调用

execute store result score @s x run data get storage ckr_utils:io input.center[0] 10000
execute store result score @s y run data get storage ckr_utils:io input.center[1] 10000
execute store result score @s z run data get storage ckr_utils:io input.center[2] 10000
execute store result score @s d run data get storage ckr_utils:io input.size[0] 10000
execute store result score @s l run data get storage ckr_utils:io input.size[1] 10000
execute store result score @s spawn_interval run data get storage ckr_utils:io input.spawn_interval
execute store result score @s spawn_timer run data get storage ckr_utils:io input.spawn_timer
execute store result score @s spawn_max run data get storage ckr_utils:io input.spawn_max
data modify entity @s data.spawn_plates set from storage ckr_utils:io input.spawn_plates