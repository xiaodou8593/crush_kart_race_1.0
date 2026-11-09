#ckr_utils:wall_area/build/loop_barrier
# ckr_utils:wall_area/_update_display调用

$fill ~ ~$(y_min) ~ ~ ~$(y_max) ~ minecraft:barrier

scoreboard players remove loop int 1
execute if score loop int matches ..0 run return fail
$execute positioned $(temp_s) run function ckr_utils:wall_area/build/loop_barrier with storage ckr_utils:io {}