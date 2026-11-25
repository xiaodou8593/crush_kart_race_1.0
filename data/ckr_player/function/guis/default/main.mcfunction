#ckr_player:guis/default/main

data modify storage iframe:io inv set from entity @s Inventory
data modify storage iframe:io sel set value {}
data modify storage iframe:io sel set from entity @s SelectedItem

# 检测GUI发生变动
scoreboard players set update_gui int 0
function iframe:player_space/_get
# 普通槽位1
execute if data storage iframe:io player.slot_1.id run function ckr_player:guis/default/main_slot_1
# 普通槽位2
execute if data storage iframe:io player.slot_2.id run function ckr_player:guis/default/main_slot_2
# 普通槽位3
execute if data storage iframe:io player.slot_3.id run function ckr_player:guis/default/main_slot_3
# 特殊槽位
execute if data storage iframe:io player.slot_spec.id run function ckr_player:guis/default/main_slot_spec
function iframe:player_space/_store
execute unless data storage iframe:io inv[{Slot:8b}].components."minecraft:custom_data"{button:8b} run scoreboard players set update_gui int 1
execute if score update_gui int matches 1 run function ckr_player:guis/default/items

# 存储按钮
execute if score @s iframe_crc_state matches 1 \
	if data storage iframe:io sel.components."minecraft:custom_data"{button:8b} \
	run function ckr_player:guis/default/trigger_back