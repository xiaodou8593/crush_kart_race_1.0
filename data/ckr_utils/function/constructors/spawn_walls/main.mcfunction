#ckr_utils:constructors/spawn_walls/main
# ckr_utils:constructors/spawn_walls/tick调用
# 实体对象主程序

function ckr_utils:constructors/spawn_walls/_get
execute if score vp_progress int matches 0 run function ckr_utils:constructors/spawn_walls/_start
function ckr_utils:constructors/spawn_walls/_iter
function ckr_utils:constructors/spawn_walls/_store
execute if score vp_progress int matches 100 run function ckr_utils:constructors/spawn_walls/_del