#ckr_utils:guis/sub_edit/main

data modify storage iframe:io inv set from entity @s Inventory
data modify storage iframe:io sel set value {}
data modify storage iframe:io sel set from entity @s SelectedItem

# 检测GUI发生变动
scoreboard players set update_gui int 0
execute unless data storage iframe:io inv[{Slot:0b}].components."minecraft:custom_data"{button:0b} run scoreboard players set update_gui int 1
execute unless data storage iframe:io inv[{Slot:1b}].components."minecraft:custom_data"{button:1b} run scoreboard players set update_gui int 1
execute unless data storage iframe:io inv[{Slot:2b}].components."minecraft:custom_data"{button:2b} run scoreboard players set update_gui int 1
execute if score update_gui int matches 1 run function ckr_utils:guis/sub_edit/items

# 检测满2个墙点
execute store result score temp_cnt int if entity @e[tag=ckr_wall_point]
execute if score temp_cnt int matches 2.. run function ckr_utils:guis/sub_edit/place_wall

# 检测满2个池点
execute store result score temp_cnt int if entity @e[tag=ckr_pool_point]
execute if score temp_cnt int matches 2.. run function ckr_utils:guis/sub_edit/place_pool

# 退出GUI
execute if score @s iframe_crc_state matches 1 \
	if data storage iframe:io sel.components."minecraft:custom_data"{button:8b} \
	run return run function ckr_utils:guis/sub_edit/exit
execute unless data storage iframe:io inv[{Slot:8b}].\
	components."minecraft:custom_data"{button:8b} \
	run return run function ckr_utils:guis/sub_edit/exit