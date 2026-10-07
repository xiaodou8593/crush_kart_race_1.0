#ckr_utils:guis/track_edit/main

data modify storage iframe:io inv set from entity @s Inventory
data modify storage iframe:io sel set value {}
data modify storage iframe:io sel set from entity @s SelectedItem

# 检测GUI发生变动
scoreboard players set update_gui int 0
execute unless data storage iframe:io inv[{Slot:0b}].components."minecraft:custom_data"{button:0b} run scoreboard players set update_gui int 1
execute unless data storage iframe:io inv[{Slot:1b}].components."minecraft:custom_data"{button:1b} run scoreboard players set update_gui int 1
execute unless data storage iframe:io inv[{Slot:2b}].components."minecraft:custom_data"{button:2b} run scoreboard players set update_gui int 1
execute unless data storage iframe:io inv[{Slot:3b}].components."minecraft:custom_data"{button:3b} run scoreboard players set update_gui int 1
execute unless data storage iframe:io inv[{Slot:4b}].components."minecraft:custom_data"{button:4b} run scoreboard players set update_gui int 1
execute unless data storage iframe:io inv[{Slot:5b}].components."minecraft:custom_data"{button:5b} run scoreboard players set update_gui int 1
execute if score update_gui int matches 1 run function ckr_utils:guis/track_edit/items

# 检测满4个斜面点
execute store result score temp_cnt int if entity @e[tag=ckr_slope_point]
execute if score temp_cnt int matches 4.. run function ckr_utils:guis/track_edit/place_slope

# 检测满2个平面点
execute store result score temp_cnt int if entity @e[tag=ckr_plane_point]
execute if score temp_cnt int matches 2.. run function ckr_utils:guis/track_edit/place_plane

# 删除质点运动
execute as @e[tag=ckr_del_point] run function ckr_utils:guis/track_edit/del_point/main
execute as @e[tag=ckr_del_point] run function ckr_utils:guis/track_edit/del_point/main
execute as @e[tag=ckr_del_point] run function ckr_utils:guis/track_edit/del_point/main

# 发射删除质点按钮
execute if score @s iframe_crc_state matches 1 \
	if data storage iframe:io sel.components."minecraft:custom_data"{button:3b} \
	run function ckr_utils:guis/track_edit/del_point/shoot

# 存储按钮
execute if score @s iframe_crc_state matches 1 \
	if data storage iframe:io sel.components."minecraft:custom_data"{button:4b} \
	run function ckr_utils:guis/track_edit/save_button

# 进入structure manager
execute if score @s iframe_crc_state matches 1 \
	if data storage iframe:io sel.components."minecraft:custom_data"{button:5b} \
	run function ckr_utils:guis/track_edit/structure_manager

# 退出GUI
execute if score @s iframe_crc_state matches 1 \
	if data storage iframe:io sel.components."minecraft:custom_data"{button:8b} \
	run return run function ckr_utils:guis/track_edit/exit
execute unless data storage iframe:io inv[{Slot:8b}].\
	components."minecraft:custom_data"{button:8b} \
	run return run function ckr_utils:guis/track_edit/exit