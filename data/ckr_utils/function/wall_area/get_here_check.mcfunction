#ckr_utils:wall_area/get_here_check
# ckr_utils:wall_area/_get_here_instance调用

scoreboard players operation stemp_abs int = @s nvec_x
execute if score stemp_abs int matches ..-1 run scoreboard players operation stemp_abs int *= -1 int

execute if score stemp_abs int matches 10000 run scoreboard players operation @s d >< @s l
execute store result score res int run compute default integer ckr_utils:wall_area/_max_dis
execute if score stemp_abs int matches 10000 run scoreboard players operation @s d >< @s l
execute if score res int matches 1.. run return fail
tag @s add result