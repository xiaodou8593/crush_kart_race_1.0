#vve_tutor:nice_bike/iter_cpoints_7_8
# vve_tutor:nice_bike/_iter_cpoints_c调用

# 顶点7介质探测
scoreboard players operation c_vx int += sstemp_rx int
scoreboard players operation c_vy int += sstemp_ry int
scoreboard players operation c_vz int += sstemp_rz int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += sstemp_ix int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += sstemp_iy int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += sstemp_iz int
#tellraw @a ["vertex 7: ", {"nbt":"xyz","storage":"math:io"}]
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_slope
execute if score bounce_layer_response int matches 1 run scoreboard players operation bounce_layer_receiver_response int += bounce_layer_response int
execute if score grab_layer_response int matches 1 run scoreboard players operation grab_layer_receiver_response int += grab_layer_response int
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:vehicle/_receive_shift
execute if score shift_response int matches 0 run function vve:vehicle/_receive_not_shift
execute if score impulse_response int matches 1 run function vve:object/_dec_impulse
scoreboard players operation surface int > surface_response int

scoreboard players operation sstemp_ix int *= 2 int
scoreboard players operation sstemp_iy int *= 2 int
scoreboard players operation sstemp_iz int *= 2 int
scoreboard players operation sstemp_rx int *= 2 int
scoreboard players operation sstemp_ry int *= 2 int
scoreboard players operation sstemp_rz int *= 2 int

# 顶点8介质探测
scoreboard players operation c_vx int -= sstemp_rx int
scoreboard players operation c_vy int -= sstemp_ry int
scoreboard players operation c_vz int -= sstemp_rz int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int -= sstemp_ix int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int -= sstemp_iy int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int -= sstemp_iz int
#tellraw @a ["vertex 8: ", {"nbt":"xyz","storage":"math:io"}]
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_slope
execute if score bounce_layer_response int matches 1 run scoreboard players operation bounce_layer_receiver_response int += bounce_layer_response int
execute if score grab_layer_response int matches 1 run scoreboard players operation grab_layer_receiver_response int += grab_layer_response int
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:vehicle/_receive_shift
execute if score shift_response int matches 0 run function vve:vehicle/_receive_not_shift
execute if score impulse_response int matches 1 run function vve:object/_dec_impulse
scoreboard players operation surface int > surface_response int