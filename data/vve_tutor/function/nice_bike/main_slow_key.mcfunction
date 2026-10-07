#vve_tutor:nice_bike/main_slow_key
# vve_tutor:nice_bike/tick调用
# 实体对象主程序

function vve_tutor:nice_bike/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion_slow_key
function vve_tutor:nice_bike/_store