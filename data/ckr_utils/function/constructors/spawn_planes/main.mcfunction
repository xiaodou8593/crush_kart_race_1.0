#ckr_utils:constructors/spawn_planes/main
# ckr_utils:constructors/spawn_planes/tick调用
# 实体对象主程序

function ckr_utils:constructors/spawn_planes/_get
execute if score vp_progress int matches 0 run function ckr_utils:constructors/spawn_planes/_start
function ckr_utils:constructors/spawn_planes/_iter
function ckr_utils:constructors/spawn_planes/_store
execute if score vp_progress int matches 100 run function ckr_utils:constructors/spawn_planes/_del