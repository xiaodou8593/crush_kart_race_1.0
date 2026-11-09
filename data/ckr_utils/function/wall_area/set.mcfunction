#ckr_utils:wall_area/set
# ckr_utils:wall_area/_new调用

execute store result score @s x run data get storage ckr_utils:io input.center[0] 10000
execute store result score @s y run data get storage ckr_utils:io input.center[1] 10000
execute store result score @s z run data get storage ckr_utils:io input.center[2] 10000
execute store result score @s d run data get storage ckr_utils:io input.size[0] 10000
execute store result score @s h run data get storage ckr_utils:io input.size[1] 10000
execute store result score @s l run data get storage ckr_utils:io input.size[2] 10000
execute store result score @s nvec_x run data get storage ckr_utils:io input.nvec[0] 10000
execute store result score @s nvec_y run data get storage ckr_utils:io input.nvec[1] 10000
execute store result score @s nvec_z run data get storage ckr_utils:io input.nvec[2] 10000