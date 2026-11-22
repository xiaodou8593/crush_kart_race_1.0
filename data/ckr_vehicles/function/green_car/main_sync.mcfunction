#ckr_vehicles:green_car/main_sync
# ckr_vehicles:green_car/tick调用
# 实体对象主程序

function ckr_vehicles:green_car/_get
# 运动同步
function vve:object/_sync_motion
function ckr_vehicles:green_car/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function ckr_vehicles:green_car/_del