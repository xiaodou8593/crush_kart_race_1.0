#vve_tutor:nice_bike/control/set_target_theta
# vve_tutor:nice_bike/control/main_surface调用

execute as 0-0-0-0-0 run function math:uvw/_to_euler
scoreboard players operation target_theta int = theta int

scoreboard players set stand_state int 1