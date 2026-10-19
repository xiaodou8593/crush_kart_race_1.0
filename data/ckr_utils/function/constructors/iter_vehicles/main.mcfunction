#ckr_utils:constructors/iter_vehicles/main
# ckr_utils:constructors/iter_vehicles/tick调用
# 实体对象主程序

function ckr_utils:constructors/iter_vehicles/_get
execute if score vp_progress int matches 0 run function ckr_utils:constructors/iter_vehicles/_start
function ckr_utils:constructors/iter_vehicles/_iter
function ckr_utils:constructors/iter_vehicles/_store
execute if score vp_progress int matches 100 run function ckr_utils:constructors/iter_vehicles/_del