#ckr_utils:wall_area/build/loop_air
# ckr_utils:wall_area/_delete_display调用

$fill ~ ~$(y_min) ~ ~ ~$(y_max) ~ minecraft:air

scoreboard players remove loop int 1
execute if score loop int matches ..0 run return fail
$execute positioned $(temp_s) run function ckr_utils:wall_area/build/loop_air with storage ckr_utils:io {}