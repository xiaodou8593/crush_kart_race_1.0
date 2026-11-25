#ckr_player:guis/default/main_slot_1
# ckr_player:guis/default/main调用

scoreboard players set temp_trigger int 0
# 右键检测
execute if score @s iframe_crc_state matches 1 \
	if data storage iframe:io sel.components."minecraft:custom_data"{button:1b} \
	run scoreboard players set temp_trigger int 1
# Q/F键检测
execute unless data storage iframe:io inv[{Slot:1b}].components."minecraft:custom_data"{button:1b} store result score temp_trigger int run scoreboard players set update_gui int 1

execute store result score temp_buy int unless data storage iframe:io player.slot_1{unbuy:1b}

# 物品程序
data modify storage ckr_items:io this_item set from storage iframe:io player.slot_1
execute if score temp_buy int matches 1 if data storage ckr_items:io this_item.main_slow_func if score @s vp_modular matches 0 run function ckr_items:_call_main_slow_func with storage ckr_items:io this_item
execute if score temp_buy int matches 1 if score temp_trigger int matches 1 run function ckr_items:_call_trigger_func with storage ckr_items:io this_item
data modify storage iframe:io player.slot_1 set from storage ckr_items:io this_item

# 购买物品逻辑
execute if score temp_trigger int matches 0 run return fail
execute if score temp_buy int matches 1 run return fail
# 获取物品价格
execute store result score temp_price int run data get storage iframe:io player.slot_1.price
# 查询当前金币数量
function ckr_player:_query_coins
# 买不起则提前返回
execute if score temp_price int > res int run return run function ckr_player:guis/default/buy_fail
# 扣除金币并获得物品
data modify storage iframe:io player.slot_1.unbuy set value 0b
function ckr_player:guis/default/buy_success