#vve_tutor:nice_bike/control/set_target_psi
# vve_tutor:nice_bike/control/main_surface调用

scoreboard players set stand_state int 0

scoreboard players set target_phi int 0
scoreboard players set target_psi int 0
scoreboard players set control_active int 1

execute if score input_a int matches 0 if score input_d int matches 0 run return fail
execute if score input_a int matches 1 if score input_d int matches 1 run return fail

# 转向动画
#execute if score input_a int matches 1 run scoreboard players add wheel_state int 6
#execute if score input_d int matches 1 run scoreboard players add wheel_state int 12

scoreboard players operation stemp_v int = vx int
scoreboard players operation stemp_v int *= kvec_x int
scoreboard players operation stemp_0 int = vy int
scoreboard players operation stemp_0 int *= kvec_y int
scoreboard players operation stemp_v int += stemp_0 int
scoreboard players operation stemp_0 int = vz int
scoreboard players operation stemp_0 int *= kvec_z int
scoreboard players operation stemp_v int += stemp_0 int
execute store result storage math:io rotation[0] float 0.00572957795130823 run scoreboard players operation stemp_v int /= rotation_r int
execute store result score stemp_v int run data get storage math:io rotation[0] 10000

execute as 0-0-0-0-0 run function math:uvw/_to_euler
scoreboard players operation target_theta int = theta int
execute if score input_a int matches 1 run scoreboard players operation target_theta int += stemp_v int
execute if score input_d int matches 1 run scoreboard players operation target_theta int -= stemp_v int

scoreboard players set stemp_min int -250000
scoreboard players set stemp_max int 250000
execute if score input_a int matches 1 run scoreboard players operation stemp_v int *= -1 int
scoreboard players operation stemp_v int *= 3 int
scoreboard players operation stemp_v int > stemp_min int
scoreboard players operation stemp_v int < stemp_max int

scoreboard players operation target_psi int = stemp_v int