#ckr_utils:pool_area/main
# ckr_utils:pool_area/tick调用
# 实体对象主程序

function ckr_utils:pool_area/_get
scoreboard players add spawn_timer int 1
scoreboard players operation spawn_timer int %= spawn_interval int
execute if score spawn_timer int matches 0 as 0-0-0-0-0 run function ckr_utils:pool_area/try_spawn
function ckr_utils:pool_area/_store