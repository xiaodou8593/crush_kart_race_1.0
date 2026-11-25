#ckr_player:guis/default/buy_success
# ckr_player:guis/default/main_slot_1调用
# ckr_player:guis/default/main_slot_2调用
# ckr_player:guis/default/main_slot_3调用
# ckr_player:guis/default/main_slot_spec调用

execute at @s run playsound minecraft:entity.blaze.hurt player @s ~ ~ ~ 1.0 1.5
scoreboard players set update_gui int 1