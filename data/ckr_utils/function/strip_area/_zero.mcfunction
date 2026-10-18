#ckr_utils:strip_area/_zero
# 把临时对象的全部数据置0

scoreboard players set x int 0
scoreboard players set y int 0
scoreboard players set z int 0
scoreboard players set chunk_x_min int 0
scoreboard players set chunk_z_min int 0
scoreboard players set chunk_x_max int 0
scoreboard players set chunk_z_max int 0
scoreboard players set d int 0
scoreboard players set h int 0
scoreboard players set l int 0
data modify storage ckr_utils:io run_func set value ""