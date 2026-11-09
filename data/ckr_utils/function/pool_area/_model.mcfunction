#ckr_utils:pool_area/_model
# 使用临时对象构建数据模板
# 输出数据模板storage ckr_utils:io result

data modify storage ckr_utils:io result set value {center:[0.0d, 0.0d, 0.0d], size:[0.0d, 0.0d], spawn_interval:0, spawn_timer:0, spawn_max:0, spawn_plates:[]}

execute store result storage ckr_utils:io result.center[0] double 0.0001 run scoreboard players get x int
execute store result storage ckr_utils:io result.center[1] double 0.0001 run scoreboard players get y int
execute store result storage ckr_utils:io result.center[2] double 0.0001 run scoreboard players get z int
execute store result storage ckr_utils:io result.size[0] double 0.0001 run scoreboard players get d int
execute store result storage ckr_utils:io result.size[1] double 0.0001 run scoreboard players get l int
execute store result storage ckr_utils:io result.spawn_interval int 1 run scoreboard players get spawn_interval int
execute store result storage ckr_utils:io result.spawn_timer int 1 run scoreboard players get spawn_timer int
execute store result storage ckr_utils:io result.spawn_max int 1 run scoreboard players get spawn_max int
data modify storage ckr_utils:io result.spawn_plates set from storage ckr_utils:io spawn_plates