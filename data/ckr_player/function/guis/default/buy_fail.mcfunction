#ckr_player:guis/default/buy_fail
# ckr_player:guis/default/main_slot_1调用
# ckr_player:guis/default/main_slot_2调用
# ckr_player:guis/default/main_slot_3调用
# ckr_player:guis/default/main_slot_spec调用


execute at @s run playsound minecraft:entity.villager.no player @s
tellraw @s {"text":"金币数量不足！","color":"red"}