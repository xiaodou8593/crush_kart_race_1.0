#ckr_utils:constructors/spawn_walls/_iter_all
# 构造迭代直到进度为100%
# 输出entity @e[tag=vp_instance]

function ckr_utils:constructors/spawn_walls/_iter
execute unless score vp_progress int matches 100.. run function ckr_utils:constructors/spawn_walls/_iter_all