#ckr_vehicles:_init
# 初始化ckr_vehicles包

# 初始化各子模块
function ckr_vehicles:green_car/init

# 爆炸计时
scoreboard objectives add ckr_vehicle_explode_timer dummy

# vp_modular计数器
scoreboard players set #ckr_vehicles: vp_modular 0