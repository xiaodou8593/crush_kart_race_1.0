#vve_tutor:blue_car/main_damage
# vve_tutor:blue_car/main_c调用

execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[dx=0,dy=0,dz=0,type=!minecraft:player,tag=] run function vve_tutor:blue_car/damage

# 坐标安全
tp @s 0 0 0