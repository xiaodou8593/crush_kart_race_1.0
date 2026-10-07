#vve_tutor:blue_car/damage
# vve_tutor:blue_car/main_damage调用

damage @s 5 vve_tutor:damage
execute at @s anchored eyes positioned ^ ^-0.5 ^ run particle minecraft:block{block_state:{id:"minecraft:redstone_block"}} ~ ~ ~ 0.0 0.0 0.0 0.2 15 force @a