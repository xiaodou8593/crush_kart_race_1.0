#ckr_utils:wall_area/build/loop_glass
# ckr_utils:wall_area/_update_display调用

$fill ~ ~$(y_min) ~ ~ ~$(y_max) ~ minecraft:magenta_stained_glass

scoreboard players remove loop int 1
execute if score loop int matches ..0 run return fail
$execute positioned $(temp_s) run function ckr_utils:wall_area/build/loop_glass with storage ckr_utils:io {}