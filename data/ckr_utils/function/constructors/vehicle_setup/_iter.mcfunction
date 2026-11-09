#ckr_utils:constructors/vehicle_setup/_iter
# 临时对象运行一次构造迭代
# 输出entity @e[tag=vp_instance]

execute store result score temp_cnt int if entity @e[tag=vve_tutor_blue_car,tag=vp_instance]
execute if score temp_cnt int matches 0 run return run scoreboard players set vp_progress int 100

execute store result score temp_cnt_v int if entity @e[tag=vve_tutor_blue_car,tag=vp_instance,tag=ckr_vehicle_inited]
# 初始化一辆车
execute as @e[tag=vve_tutor_blue_car,tag=vp_instance,tag=!ckr_vehicle_inited,limit=1] run function ckr_utils:constructors/vehicle_setup/init_func

# 计算构造进度
scoreboard players operation vp_progress int = temp_cnt_v int
scoreboard players operation vp_progress int *= 100 int
scoreboard players operation vp_progress int /= temp_cnt int
scoreboard players operation vp_progress int > 1 int