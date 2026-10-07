#vve_tutor:nice_bike/main_c
# vve_tutor:nice_bike/tick调用
# 实体对象主程序

function vve_tutor:nice_bike/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion
# 介质探测
execute as 0-0-0-0-0 run function vve_tutor:nice_bike/_iter_cpoints_c
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
# 获取位移点数量
execute store result score shift_cnt int run data get storage vve:io shift_points
# 介质响应
execute if score shift_response int matches 1 if score surface int matches 0 if score shift_cnt int matches ..2 run function vve:object/_apply_shift
execute if score impulse_response int matches 1 run function vve:object/_apply_impulse_f
execute if score couple_response int matches 1 as 0-0-0-0-0 run function vve:box_object/_apply_couple
# 姿态角速度修正
tag @s[tag=vve_surface] remove vve_surface
execute if score shift_cnt int matches 1.. run tag @s add vve_surface
execute if score shift_cnt int matches 3.. run scoreboard players set surface int 1
scoreboard players set temp_surface int 0
execute if score surface int matches 1 as 0-0-0-0-0 run function vve_tutor:nice_bike/_regular
function vve:object/_apply_friction
# 按键控制
execute on passengers run function vve_tutor:nice_bike/control/get_signal
execute if entity @s[tag=vve_surface] run function vve_tutor:nice_bike/control/main_surface
execute if entity @s[tag=!vve_surface] run function vve_tutor:nice_bike/control/main_air
# 发动机引擎
scoreboard players set res int 1
execute if score target_power int matches 0 if score damp_x int matches 0 if score damp_v int matches 0 run scoreboard players set res int 0
execute if score res int matches 1 run function vve:vehicle/engine/main
# 姿态控制器
execute if score control_active int matches 1 run function vve_tutor:nice_bike/control_active
execute unless score @s wheel_state = wheel_state int store result entity @s item.components."minecraft:custom_model_data".floats[0] float 1 run scoreboard players get wheel_state int
# 运动同步
function vve:object/_sync_motion
function vve_tutor:nice_bike/_store

# 获取速度L无穷范数
scoreboard players operation temp_max int = vx int
execute if score temp_max int matches ..-1 run scoreboard players operation temp_max int *= -1 int
scoreboard players operation temp_abs int = vy int
execute if score temp_abs int matches ..-1 run scoreboard players operation temp_abs int *= -1 int
scoreboard players operation temp_max int > temp_abs int
scoreboard players operation temp_abs int = vz int
execute if score temp_abs int matches ..-1 run scoreboard players operation temp_abs int *= -1 int
scoreboard players operation temp_max int > temp_abs int
# 点燃程序
execute if score temp_max int matches 800.. at @s as @e[distance=..3.5,type=#minecraft:undead] run function vve_tutor:nice_bike/main_fire

# 声音程序
function vve:sound/_get
execute at @s positioned ~ ~0.5 ~ as 0-0-0-0-0 run function vve_tutor:nice_bike/sound/main
function vve:sound/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_tutor:nice_bike/_del