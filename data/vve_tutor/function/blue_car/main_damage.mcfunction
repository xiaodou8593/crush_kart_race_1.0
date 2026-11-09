#vve_tutor:blue_car/main_damage
# vve_tutor:blue_car/main_c调用

scoreboard players operation inp int = temp_max int
execute store result score res int run random value 400..600 ckr_mobs:damage_rand
scoreboard players operation inp int /= res int

data modify storage ckr_mobs:io input_uuid set from entity @s UUID
#execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[dx=0,dy=0,dz=0,tag=ckr_mobs] run function vve_tutor:blue_car/damage
execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[dx=0,dy=0,dz=0,tag=ckr_mobs] run function ckr_mobs:generic/_damage_as