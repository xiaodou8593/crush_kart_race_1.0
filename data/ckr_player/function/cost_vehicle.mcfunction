#ckr_player:cost_vehicle
# ckr_player:main_low调用

scoreboard players remove temp_cost int 20

function vp_core:player_space/_get
execute store result score temp_hp int run data get storage vp_core:io result.vehicle_hp
execute store result storage vp_core:io result.vehicle_hp int 1 run scoreboard players operation temp_hp int += temp_cost int
function vp_core:player_space/_store

execute if score temp_hp int matches ..0 run function ckr_player:explode_vehicle

effect give @s minecraft:instant_health 1 5 true

tag @s add ckr_ui_update