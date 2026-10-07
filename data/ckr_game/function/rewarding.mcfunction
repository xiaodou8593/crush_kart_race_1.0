#ckr_game:rewarding
# ckr_game:main调用

# 奖励计时结束
execute unless entity @e[tag=vp_rewarding,limit=1] run return run data modify storage vp_core:io game_state set value "over"
# 获取奖励计时
scoreboard players operation temp_duration int = @e[tag=vp_rewarding,limit=1] killtime

# 奖励结算
execute if score temp_duration int matches 280 as @a[tag=vp_gamer,limit=1] run function ckr_game:gain_emerald

# 烟花效果
scoreboard players operation temp_mod int = temp_duration int
scoreboard players operation temp_mod int %= 10 int
execute if score temp_mod int matches 5 at @a[tag=vp_gamer,limit=1] as @e[tag=math_marker,limit=1] run function vp_core:utils/firework_shooter/_run