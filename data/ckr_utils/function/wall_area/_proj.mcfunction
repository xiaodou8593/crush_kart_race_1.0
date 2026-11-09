#ckr_utils:wall_area/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage ckr_utils:io input

execute store result score x int run data get storage ckr_utils:io input.center[0] 10000
execute store result score y int run data get storage ckr_utils:io input.center[1] 10000
execute store result score z int run data get storage ckr_utils:io input.center[2] 10000
execute store result score d int run data get storage ckr_utils:io input.size[0] 10000
execute store result score h int run data get storage ckr_utils:io input.size[1] 10000
execute store result score l int run data get storage ckr_utils:io input.size[2] 10000
execute store result score nvec_x int run data get storage ckr_utils:io input.nvec[0] 10000
execute store result score nvec_y int run data get storage ckr_utils:io input.nvec[1] 10000
execute store result score nvec_z int run data get storage ckr_utils:io input.nvec[2] 10000