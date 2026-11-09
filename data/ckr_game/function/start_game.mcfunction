#ckr_game:start_game
# ckr_game:main调用

# 设置游戏开始
gamerule mob_griefing false
gamerule mob_drops false
execute as @e[tag=vve_slope_display] run data modify entity @s brightness set value {sky:15,block:15}

# 下一刻跳转到倒计时状态
data modify storage vp_core:io game_state set value "counting_down"

# 不满足开始条件则跳转到结束状态
function ckr_game:_start_check
execute if score res int matches 0 run data modify storage vp_core:io game_state set value "over"

# 标题设置
title @a[tag=vp_gamer] reset

scoreboard players set game_timer int 80