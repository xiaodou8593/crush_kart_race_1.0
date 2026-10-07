#vve_tutor:barrier_wall_2
# vve_tutor:barrier_wall_geo调用

execute if block ~2 ~ ~ minecraft:magenta_stained_glass store result score sres int run scoreboard players set nvec_x int -10000
execute if block ~-2 ~ ~ minecraft:magenta_stained_glass store result score sres int run scoreboard players set nvec_x int 10000
execute if block ~ ~ ~2 minecraft:magenta_stained_glass store result score sres int run scoreboard players set nvec_z int -10000
execute if block ~ ~ ~-2 minecraft:magenta_stained_glass store result score sres int run scoreboard players set nvec_z int 10000