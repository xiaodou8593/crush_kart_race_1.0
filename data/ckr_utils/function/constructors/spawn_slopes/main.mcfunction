#ckr_utils:constructors/spawn_slopes/main
# ckr_utils:constructors/spawn_slopes/tick调用
# 实体对象主程序

function ckr_utils:constructors/spawn_slopes/_get
execute if score vp_progress int matches 0 run function ckr_utils:constructors/spawn_slopes/_start
function ckr_utils:constructors/spawn_slopes/_iter
function ckr_utils:constructors/spawn_slopes/_store
execute if score vp_progress int matches 100 run function ckr_utils:constructors/spawn_slopes/_del