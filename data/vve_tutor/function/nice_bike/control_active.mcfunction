#vve_tutor:nice_bike/control_active
# vve_tutor:nice_bike/main_c调用

execute as 0-0-0-0-0 run function vve:euler_control/main_theta_psi
scoreboard players set inertia int 100
scoreboard players operation spin_z int = scale_v int
execute store result score spin_x int store result score spin_y int run scoreboard players operation spin_z int *= -1 int
scoreboard players operation spin_x int *= jvec_x int
scoreboard players operation spin_y int *= jvec_y int
scoreboard players operation spin_z int *= jvec_z int
scoreboard players operation spin_x int /= 10000 int
scoreboard players operation spin_y int /= 10000 int
scoreboard players operation spin_z int /= 10000 int
scoreboard players operation spin_x int += x int
scoreboard players operation spin_y int += y int
scoreboard players operation spin_z int += z int
execute as 0-0-0-0-0 run function vve:object/_apply_spin