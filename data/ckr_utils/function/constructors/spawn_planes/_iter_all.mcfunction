#ckr_utils:constructors/spawn_planes/_iter_all
# 完全迭代直到进度为100%
# 输出entity @e[tag=vp_instance]

function ckr_utils:constructors/spawn_planes/_iter
execute unless score vp_progress int matches 100.. run function ckr_utils:constructors/spawn_planes/_iter_all