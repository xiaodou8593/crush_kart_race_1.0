#ckr_player:guis/default/items

function iframe:player_space/_get

clear @s

# 填充GUI物品

# 填充普通槽位1
execute if data storage iframe:io player.slot_1.id run function ckr_player:guis/default/fill_slot_1
# 填充普通槽位2
execute if data storage iframe:io player.slot_2.id run function ckr_player:guis/default/fill_slot_2
# 填充普通槽位3
execute if data storage iframe:io player.slot_3.id run function ckr_player:guis/default/fill_slot_3
# 填充特殊槽位
execute if data storage iframe:io player.slot_spec.id run function ckr_player:guis/default/fill_slot_spec

item replace entity @s hotbar.8 with minecraft:clay_ball[\
	minecraft:custom_data={\
		iframe_ui:1b,\
		button:8b\
	},\
	minecraft:custom_name={\
		text:"back to check point",\
		color:"red"\
	},\
	minecraft:item_model="minecraft:barrier",\
	minecraft:consumable={\
		consume_seconds:1024.0f\
	}\
]