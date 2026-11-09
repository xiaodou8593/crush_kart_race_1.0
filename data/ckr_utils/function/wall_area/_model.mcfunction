#ckr_utils:wall_area/_model
# 使用临时对象构建数据模板
# 输出数据模板storage ckr_utils:io result

data modify storage ckr_utils:io result set value {center:[0.0d, 0.0d, 0.0d], size:[0.0d, 0.0d, 0.0d], nvec:[0.0d, 0.0d, 0.0d]}

execute store result storage ckr_utils:io result.center[0] double 0.0001 run scoreboard players get x int
execute store result storage ckr_utils:io result.center[1] double 0.0001 run scoreboard players get y int
execute store result storage ckr_utils:io result.center[2] double 0.0001 run scoreboard players get z int
execute store result storage ckr_utils:io result.size[0] double 0.0001 run scoreboard players get d int
execute store result storage ckr_utils:io result.size[1] double 0.0001 run scoreboard players get h int
execute store result storage ckr_utils:io result.size[2] double 0.0001 run scoreboard players get l int
execute store result storage ckr_utils:io result.nvec[0] double 0.0001 run scoreboard players get nvec_x int
execute store result storage ckr_utils:io result.nvec[1] double 0.0001 run scoreboard players get nvec_y int
execute store result storage ckr_utils:io result.nvec[2] double 0.0001 run scoreboard players get nvec_z int