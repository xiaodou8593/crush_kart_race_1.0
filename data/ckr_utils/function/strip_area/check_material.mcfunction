#ckr_utils:strip_area/check_material

execute store result score res int run compute default integer ckr_utils:strip_area/_max_dis
execute if score res int matches 1.. run return fail

scoreboard players operation index int = @s index
data modify storage ckr_utils:io run_func set from entity @s data.run_func
scoreboard players operation respawn_x int = @s respawn_x
scoreboard players operation respawn_y int = @s respawn_y
scoreboard players operation respawn_z int = @s respawn_z
execute as @e[tag=tmp,limit=1] run function ckr_utils:strip_area/info with storage ckr_utils:io {}