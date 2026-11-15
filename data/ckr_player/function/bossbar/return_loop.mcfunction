#ckr_player:bossbar/return_loop
# ckr_player:bossbar/_return_all调用

data modify storage ckr_player:io temp_ptr set from storage ckr_player:io active_bossbars[0]
function ckr_player:bossbar/return_this with storage ckr_player:io {}

data modify storage ckr_player:io active_bossbars append from storage ckr_player:io active_bossbars[0]
data remove storage ckr_player:io active_bossbars[0]
scoreboard players remove loop int 1
execute if score loop int matches 1.. run function ckr_player:bossbar/return_loop