#vve_tutor:barrier_wall_south
# vve_tutor:barrier_wall_geo调用

scoreboard players operation grab_depth int = c_z int
scoreboard players operation grab_depth int %= 10000 int
scoreboard players operation grab_depth int *= -1 int
scoreboard players add grab_depth int 10000

execute if block ~ ~ ~1 minecraft:magenta_stained_glass run scoreboard players add grab_depth int 10000