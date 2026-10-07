#vve_tutor:barrier_wall_geo
# vve_tutor:barrier_wall调用

scoreboard players set nvec_x int 0
scoreboard players set nvec_y int 0
scoreboard players set nvec_z int 0

# 考虑地面
execute if score c_y int <= plane_y int run scoreboard players set nvec_y int 10000

scoreboard players set sres int 0
execute if block ~1 ~ ~ minecraft:magenta_stained_glass store result score sres int run scoreboard players set nvec_x int -10000
execute if block ~-1 ~ ~ minecraft:magenta_stained_glass store result score sres int run scoreboard players set nvec_x int 10000
execute if block ~ ~ ~1 minecraft:magenta_stained_glass store result score sres int run scoreboard players set nvec_z int -10000
execute if block ~ ~ ~-1 minecraft:magenta_stained_glass store result score sres int run scoreboard players set nvec_z int 10000
execute if score sres int matches 0 run function vve_tutor:barrier_wall_2
execute if score sres int matches 0 run return run function vve_tutor:barrier_wall_up

execute if score nvec_x int matches -10000 run return run function vve_tutor:barrier_wall_west
execute if score nvec_x int matches 10000 run return run function vve_tutor:barrier_wall_east
execute if score nvec_z int matches -10000 run return run function vve_tutor:barrier_wall_north
execute if score nvec_z int matches 10000 run return run function vve_tutor:barrier_wall_south