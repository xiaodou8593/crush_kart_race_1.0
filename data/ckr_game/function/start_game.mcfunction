#ckr_game:start_game
# ckr_game:main调用

# 设置游戏开始
execute as @e[tag=vve_slope_display] run data modify entity @s brightness set value {sky:15,block:15}

# 下一刻跳转到进行状态
data modify storage vp_core:io game_state set value "running"

# 不满足开始条件则跳转到结束状态
function ckr_game:_start_check
execute if score res int matches 0 run data modify storage vp_core:io game_state set value "over"