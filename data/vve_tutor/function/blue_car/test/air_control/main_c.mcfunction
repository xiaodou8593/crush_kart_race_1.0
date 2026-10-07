#vve_tutor:blue_car/test/air_control/main_c
# 实体对象主程序

function vve_tutor:blue_car/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion
# 介质探测
#execute as 0-0-0-0-0 run function vve:vehicle/_iter_cpoints_c
execute as 0-0-0-0-0 run function vve_tutor:blue_car/_iter_cpoints_plane
# 力学迭代
#scoreboard players operation vy int -= vve_gravity int
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
execute if score surface int matches 1 as 0-0-0-0-0 run function vve:vehicle/_regular
execute if score surface int matches 0 if score shift_cnt int matches 0 if score grab_layer_response int matches 3.. if score grab_layer_receiver_v_norm int < grab_layer_regular_v int as 0-0-0-0-0 run function vve:object/_regular
function vve:object/_apply_friction
# 姿态控制
function vve:euler_control/_get
execute as 0-0-0-0-0 run function vve:euler_control/main_angular
# 按键控制
execute on passengers run function vve_tutor:blue_car/control/get_signal
execute if entity @s[tag=vve_surface] run function vve_tutor:blue_car/control/main_surface
execute if entity @s[tag=!vve_surface] run function vve_tutor:blue_car/control/main_air
function vve:euler_control/_store
# 发动机引擎
scoreboard players set res int 1
execute if score target_power int matches 0 if score damp_x int matches 0 if score damp_v int matches 0 run scoreboard players set res int 0
execute if score res int matches 1 run function vve:vehicle/engine/main
# 运动同步
function vve:object/_sync_motion
function vve_tutor:blue_car/_store

# 声音程序
function vve:sound/_get
execute at @s positioned ~ ~0.5 ~ as 0-0-0-0-0 run function vve_examples:green_car/sound/main
function vve:sound/_store

# 获取速度L无穷范数
scoreboard players operation temp_max int = vx int
execute if score temp_max int matches ..-1 run scoreboard players operation temp_max int *= -1 int
scoreboard players operation temp_abs int = vy int
execute if score temp_abs int matches ..-1 run scoreboard players operation temp_abs int *= -1 int
scoreboard players operation temp_max int > temp_abs int
scoreboard players operation temp_abs int = vz int
execute if score temp_abs int matches ..-1 run scoreboard players operation temp_abs int *= -1 int
scoreboard players operation temp_max int > temp_abs int
# 伤害程序
scoreboard players set u int 0
scoreboard players set v int 0
scoreboard players set w int 9000
execute if score temp_max int matches 500.. as 0-0-0-0-0 run function math:uvw/_topos
execute if score temp_max int matches 500.. as 0-0-0-0-0 at @s run function vve_tutor:blue_car/main_damage

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_tutor:blue_car/_del