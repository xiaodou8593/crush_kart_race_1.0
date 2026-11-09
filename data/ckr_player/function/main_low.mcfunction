#ckr_player:main_low
# ckr_game:running调用

# 玩家恢复饱食度
effect give @s minecraft:saturation 1 10 true

# 更新ui
execute if entity @s[tag=ckr_ui_update] run function ckr_player:update_ui