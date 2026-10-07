#vve_tutor:blue_car/main_slow_mov
# vve_tutor:blue_car/tick调用
# 实体对象主程序

function vve_tutor:blue_car/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion_slow_mov
function vve_tutor:blue_car/_store