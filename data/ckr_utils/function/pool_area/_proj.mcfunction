#ckr_utils:pool_area/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage ckr_utils:io input

execute store result score x int run data get storage ckr_utils:io input.center[0] 10000
execute store result score y int run data get storage ckr_utils:io input.center[1] 10000
execute store result score z int run data get storage ckr_utils:io input.center[2] 10000
execute store result score d int run data get storage ckr_utils:io input.size[0] 10000
execute store result score l int run data get storage ckr_utils:io input.size[1] 10000
execute store result score spawn_interval int run data get storage ckr_utils:io input.spawn_interval
execute store result score spawn_timer int run data get storage ckr_utils:io input.spawn_timer
execute store result score spawn_max int run data get storage ckr_utils:io input.spawn_max
data modify storage ckr_utils:io spawn_plates set from storage ckr_utils:io input.spawn_plates