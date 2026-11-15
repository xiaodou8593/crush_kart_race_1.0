#ckr_player:main_low
# ckr_game:running调用

# 玩家恢复饱食度
effect give @s minecraft:saturation 1 10 true

# 检测血量
execute store result score temp_cost int run data get entity @s Health
execute if score temp_cost int matches ..19 run function ckr_player:cost_vehicle

# 更新ui
execute if entity @s[tag=ckr_ui_update] run function ckr_player:update_ui