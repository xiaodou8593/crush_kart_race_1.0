#ckr_player:guis/default/fill_slot_3
# ckr_player:guis/default/items调用

data modify storage iframe:io player.slot_3.components."minecraft:custom_data" merge value {iframe_ui:1b,button:3b}
execute store result storage iframe:io player.slot_3.components."minecraft:custom_model_data".floats[0] float -1 run data get storage iframe:io player.slot_3.unbuy
data modify entity 0-0-0-0-2 item set from storage iframe:io player.slot_3
item replace entity @s hotbar.3 from entity 0-0-0-0-2 container.0