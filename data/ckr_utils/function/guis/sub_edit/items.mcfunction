#ckr_utils:guis/sub_edit/items

function iframe:player_space/_get

clear @s

# 填充GUI物品
item replace entity @s hotbar.0 with minecraft:shulker_spawn_egg[\
	minecraft:entity_data={\
		id:"minecraft:shulker",\
		NoAI:1b,\
		Silent:1b,\
		Color:15b,\
		Tags:["ckr_wall_point"],\
		CustomName:"wall_point",\
		CustomNameVisible:1b,\
		DeathLootTable:""\
	},\
	minecraft:custom_name={\
		text:"wall_point",\
		color:"red"\
	},\
	minecraft:custom_data={\
		iframe_ui:1b,\
		button:0b\
	}\
]

item replace entity @s hotbar.1 with minecraft:shulker_spawn_egg[\
	minecraft:entity_data={\
		id:"minecraft:shulker",\
		NoAI:1b,\
		Silent:1b,\
		Color:6b,\
		Tags:["ckr_pool_point"],\
		CustomName:"pool_point",\
		CustomNameVisible:1b,\
		DeathLootTable:""\
	},\
	minecraft:custom_name={\
		text:"pool_point",\
		color:"green"\
	},\
	minecraft:custom_data={\
		iframe_ui:1b,\
		button:1b\
	}\
]

item replace entity @s hotbar.2 with minecraft:iron_sword[\
	minecraft:enchantments={\
		"minecraft:sharpness":255\
	},\
	minecraft:custom_data={\
		iframe_ui:1b,\
		button:2b\
	}\
]

item replace entity @s hotbar.8 with minecraft:clay_ball[\
	minecraft:custom_data={\
		iframe_ui:1b,\
		button:8b\
	},\
	minecraft:custom_name={\
		text:"exit",\
		color:"red"\
	},\
	minecraft:item_model="minecraft:barrier",\
	minecraft:consumable={\
		consume_seconds:1024.0f\
	}\
]