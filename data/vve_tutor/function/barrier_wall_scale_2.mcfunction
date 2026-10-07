#vve_tutor:barrier_wall_scale_2
# vve_tutor:barrier_wall调用

execute store result storage math:io xyz[0] double 0.00014142135 run scoreboard players get grab_depth int
execute store result score grab_depth int run data get storage math:io xyz[0] 10000