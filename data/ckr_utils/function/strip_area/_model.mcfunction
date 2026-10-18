#ckr_utils:strip_area/_model
# 使用临时对象构建数据模板
# 输出数据模板storage ckr_utils:io result

data modify storage ckr_utils:io result set value {coord:[0.0d, 0.0d, 0.0d], chunk_range:[0.0d, 0.0d, 0.0d, 0.0d], size:[0.0d, 0.0d, 0.0d], run_func:""}

execute store result storage ckr_utils:io result.coord[0] double 0.0001 run scoreboard players get x int
execute store result storage ckr_utils:io result.coord[1] double 0.0001 run scoreboard players get y int
execute store result storage ckr_utils:io result.coord[2] double 0.0001 run scoreboard players get z int
execute store result storage ckr_utils:io result.chunk_range[0] double 1 run scoreboard players get chunk_x_min int
execute store result storage ckr_utils:io result.chunk_range[1] double 1 run scoreboard players get chunk_z_min int
execute store result storage ckr_utils:io result.chunk_range[2] double 1 run scoreboard players get chunk_x_max int
execute store result storage ckr_utils:io result.chunk_range[3] double 1 run scoreboard players get chunk_z_max int
execute store result storage ckr_utils:io result.size[0] double 0.0001 run scoreboard players get d int
execute store result storage ckr_utils:io result.size[1] double 0.0001 run scoreboard players get h int
execute store result storage ckr_utils:io result.size[2] double 0.0001 run scoreboard players get l int
data modify storage ckr_utils:io result.run_func set from storage ckr_utils:io run_func