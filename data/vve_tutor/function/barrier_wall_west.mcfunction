#vve_tutor:barrier_wall_west
# vve_tutor:barrier_wall_geo调用

scoreboard players operation grab_depth int = c_x int
scoreboard players operation grab_depth int %= 10000 int

execute if block ~-1 ~ ~ minecraft:magenta_stained_glass run scoreboard players add grab_depth int 10000