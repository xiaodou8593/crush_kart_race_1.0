#ckr_utils:constructors/spawn_pools/main
# ckr_utils:constructors/spawn_pools/tick调用
# 实体对象主程序

function ckr_utils:constructors/spawn_pools/_get
execute if score vp_progress int matches 0 run function ckr_utils:constructors/spawn_pools/_start
function ckr_utils:constructors/spawn_pools/_iter
function ckr_utils:constructors/spawn_pools/_store
execute if score vp_progress int matches 100 run function ckr_utils:constructors/spawn_pools/_del