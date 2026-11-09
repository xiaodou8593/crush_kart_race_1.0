#ckr_utils:pool_area/get_here_check
# ckr_utils:pool_area/_get_here_instance调用

execute store result score res int run compute default integer ckr_utils:pool_area/_max_dis
execute if score res int matches 1.. run return fail
tag @s add result