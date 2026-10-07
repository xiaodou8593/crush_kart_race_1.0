#ckr_utils:guis/track_edit/items

function iframe:player_space/_get

clear @s

# 填充GUI物品
item replace entity @s hotbar.0 with minecraft:shulker_spawn_egg[\
	minecraft:entity_data={\
		id:"minecraft:shulker",\
		NoAI:1b,\
		Silent:1b,\
		Color:14b,\
		Tags:["ckr_slope_point"],\
		CustomName:"slope_point",\
		CustomNameVisible:1b,\
		DeathLootTable:""\
	},\
	minecraft:custom_name={\
		text:"slope_point",\
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
		Color:5b,\
		Tags:["ckr_plane_point"],\
		CustomName:"plane_point",\
		CustomNameVisible:1b,\
		DeathLootTable:""\
	},\
	minecraft:custom_name={\
		text:"plane_point",\
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

item replace entity @s hotbar.3 with minecraft:iron_nugget[\
	minecraft:custom_name={\
		text:"delete point",\
		color:"gray"\
	},\
	minecraft:custom_data={\
		iframe_ui:1b,\
		button:3b\
	},\
	minecraft:consumable={\
		consume_seconds:1024.0f\
	}\
]

item replace entity @s hotbar.4 with minecraft:music_disc_cat[\
	minecraft:custom_name={\
		text:"save track",\
		color:"green"\
	},\
	minecraft:custom_data={\
		iframe_ui:1b,\
		button:4b\
	},\
	minecraft:consumable={\
		consume_seconds:1024.0f\
	}\
]

item replace entity @s hotbar.5 with minecraft:structure_block[\
	minecraft:custom_name={\
		text:"structure manager",\
		color:"red"\
	},\
	minecraft:custom_data={\
		iframe_ui:1b,\
		button:5b\
	},\
	minecraft:consumable={\
		consume_seconds:1024.0f\
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