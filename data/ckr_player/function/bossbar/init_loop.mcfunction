#ckr_player:bossbar/init_loop
# ckr_player:bossbar/init调用

$bossbar add ckr_player:bossbar_$(index) ""
$data modify storage ckr_player:io free_bossbars append value "ckr_player:bossbar_$(index)"

execute store result storage ckr_player:io index int 1 run scoreboard players remove loop int 1
execute if score loop int matches 1.. run function ckr_player:bossbar/init_loop with storage ckr_player:io {}