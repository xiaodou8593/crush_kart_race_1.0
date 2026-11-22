#ckr_vehicles:green_car/main_slow_key
# ckr_vehicles:green_car/tick调用
# 实体对象主程序

function ckr_vehicles:green_car/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion_slow_key
function ckr_vehicles:green_car/_store