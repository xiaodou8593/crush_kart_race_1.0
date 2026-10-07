#vve_tutor:barrier_wall_up
# vve_tutor:barrier_wall_geo调用

scoreboard players operation grab_depth int = c_y int
scoreboard players operation grab_depth int %= 10000 int
scoreboard players operation grab_depth int *= -1 int
scoreboard players add grab_depth int 10000

scoreboard players set nvec_y int 10000