#ckr_vehicles:green_car/control/main_air
# ckr_vehicles:green_car/main_c调用

# 爆炸状态不可操控
execute if entity @s[tag=ckr_vehicle_exploding] run return fail

scoreboard players set inp int 0
execute if score input_w int matches 0 if score input_s int matches 0 run scoreboard players set target_power int 0

scoreboard players set inp int 800
execute if score input_a int matches 1 if score input_d int matches 0 as 0-0-0-0-0 if score grab_layer_response int matches 2.. run function vve:vehicle/_set_roll
scoreboard players set inp int -800
execute if score input_a int matches 0 if score input_d int matches 1 as 0-0-0-0-0 if score grab_layer_response int matches 2.. run function vve:vehicle/_set_roll
scoreboard players set inp int 0
execute if score input_a int matches 0 if score input_d int matches 0 as 0-0-0-0-0 if score grab_layer_response int matches 2.. run function vve:vehicle/_set_roll

# 打开滑翔伞
execute if entity @s[tag=ckr_gliding] if score input_ctrl int matches 1 on passengers if entity @s[type=minecraft:item_display] run return run function ckr_gliders:glassier/_del
execute if score input_space int matches 0 run return fail
execute if entity @s[tag=ckr_gliding] run return fail
data modify storage ckr_gliders:io input set from storage ckr_gliders:class glassier_plate
execute at @s run function ckr_gliders:glassier/_new
ride @e[tag=result,limit=1] mount @s
tag @s add ckr_gliding