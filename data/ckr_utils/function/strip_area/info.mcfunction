#ckr_utils:strip_area/info
# ckr_utils:strip_area/check_material调用

execute if entity @s[tag=ckr_utils_strip_area_info] run return fail
$function $(run_func)
tag @s add ckr_utils_strip_area_info
scoreboard players set @s ckr_utils_strip_area_info 15
schedule function ckr_utils:strip_area/info_timer 1t replace