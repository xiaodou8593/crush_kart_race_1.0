#ckr_utils:constructors/vehicle_setup/main
# ckr_utils:constructors/vehicle_setup/tick调用
# 实体对象主程序

function ckr_utils:constructors/vehicle_setup/_get
execute if score vp_progress int matches 0 run function ckr_utils:constructors/vehicle_setup/_start
function ckr_utils:constructors/vehicle_setup/_iter
function ckr_utils:constructors/vehicle_setup/_store
execute if score vp_progress int matches 100 run function ckr_utils:constructors/vehicle_setup/_del