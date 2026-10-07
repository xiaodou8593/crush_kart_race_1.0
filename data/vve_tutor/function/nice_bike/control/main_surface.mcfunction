#vve_tutor:nice_bike/control/main_surface
# vve_tutor:nice_bike/main_c调用

# 空格键等价于S键
scoreboard players operation input_s int > input_space int

scoreboard players operation inp int = backward_power int
execute if score input_space int matches 1 run scoreboard players set inp int 0
execute if score input_s int matches 1 run function vve:vehicle/engine/_set_power
scoreboard players operation inp int = forward_power int
execute if score input_w int matches 1 run function vve:vehicle/engine/_set_power
scoreboard players set inp int 0
execute if score input_w int matches 0 if score input_s int matches 0 run function vve:vehicle/engine/_set_power

#scoreboard players operation r int = rotation_r int
#scoreboard players set sign int 1
#execute if score shift_cnt_front int matches 1.. if score input_a int matches 1 if score input_d int matches 0 as 0-0-0-0-0 run function vve:vehicle/_set_rotation
#scoreboard players operation sign int *= -1 int
#execute if score shift_cnt_front int matches 1.. if score input_d int matches 1 if score input_a int matches 0 as 0-0-0-0-0 run function vve:vehicle/_set_rotation
#scoreboard players set sign int 0
#execute if score shift_cnt int matches 3.. if score input_a int matches 0 if score input_d int matches 0 as 0-0-0-0-0 run function vve:vehicle/_set_rotation

execute unless score temp_v int matches -75..75 if score global_rate int matches 2 run scoreboard players add wheel_state int 1
scoreboard players operation wheel_state int %= 2 int
scoreboard players operation stemp_max int = input_w int
scoreboard players operation stemp_max int > input_s int
scoreboard players operation stemp_max int > input_a int
scoreboard players operation stemp_max int > input_d int

# 初始偏航角
execute if score stemp_max int matches 0 run function vve_tutor:nice_bike/control/set_target_theta

# 横滚控制
execute if score stemp_max int matches 1 run function vve_tutor:nice_bike/control/set_target_psi

execute if score temp_surface int matches 1 run scoreboard players add wheel_state int 2
execute if score temp_surface int matches 2 run scoreboard players add wheel_state int 4