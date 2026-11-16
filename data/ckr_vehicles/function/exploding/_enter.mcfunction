#ckr_vehicles:exploding/_enter
# 使一辆载具进入爆炸状态
# 传入载具实例为执行者

tag @s add ckr_vehicle_exploding
scoreboard players set @s ckr_vehicle_explode_timer 3

execute on passengers on passengers run effect give @s minecraft:resistance 3 5 true