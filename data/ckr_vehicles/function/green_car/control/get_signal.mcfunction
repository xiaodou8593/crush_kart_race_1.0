#ckr_vehicles:green_car/control/get_signal
# ckr_vehicles:green_car/control/main_c调用

scoreboard players set input_w int 0
scoreboard players set input_a int 0
scoreboard players set input_s int 0
scoreboard players set input_d int 0
scoreboard players set input_ctrl int 0
scoreboard players set input_shift int 0
scoreboard players set input_space int 0
execute on passengers run function ckr_vehicles:green_car/control/get_signal_true