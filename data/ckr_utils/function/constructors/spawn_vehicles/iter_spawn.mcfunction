#ckr_utils:constructors/spawn_vehicles/iter_spawn
# ckr_utils:constructors/spawn_vehicles/_iter调用

data modify entity @s Pos set from storage vve_tutor:io input.center
execute at @s run function vve_tutor:blue_car/_new
# 区块安全
tp @s 0 0 0