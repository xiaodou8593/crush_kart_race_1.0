#ckr_utils:strip_area/set
# ckr_utils:strip_area/_new调用

execute store result score @s x run data get storage ckr_utils:io input.coord[0] 10000
execute store result score @s y run data get storage ckr_utils:io input.coord[1] 10000
execute store result score @s z run data get storage ckr_utils:io input.coord[2] 10000
execute store result score @s chunk_x_min run data get storage ckr_utils:io input.chunk_range[0]
execute store result score @s chunk_z_min run data get storage ckr_utils:io input.chunk_range[1]
execute store result score @s chunk_x_max run data get storage ckr_utils:io input.chunk_range[2]
execute store result score @s chunk_z_max run data get storage ckr_utils:io input.chunk_range[3]
execute store result score @s d run data get storage ckr_utils:io input.size[0] 10000
execute store result score @s h run data get storage ckr_utils:io input.size[1] 10000
execute store result score @s l run data get storage ckr_utils:io input.size[2] 10000
data modify entity @s data.run_func set from storage ckr_utils:io input.run_func