#ckr_player:guis/default/main

data modify storage iframe:io inv set from entity @s Inventory
data modify storage iframe:io sel set value {}
data modify storage iframe:io sel set from entity @s SelectedItem

# 检测GUI发生变动
scoreboard players set update_gui int 0
execute unless data storage iframe:io inv[{Slot:8b}].components."minecraft:custom_data"{button:8b} run scoreboard players set update_gui int 1
execute if score update_gui int matches 1 run function ckr_player:guis/default/items

# 存储按钮
execute if score @s iframe_crc_state matches 1 \
	if data storage iframe:io sel.components."minecraft:custom_data"{button:8b} \
	run function ckr_player:guis/default/trigger_back