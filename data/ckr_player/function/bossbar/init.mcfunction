#ckr_player:bossbar/init
# ckr_player:_init调用

# 数据结构
data modify storage ckr_player:io free_bossbars set value []
data modify storage ckr_player:io active_bossbars set value []

# 初始化容量
execute store result storage ckr_player:io index int 1 run scoreboard players set loop int 16
execute if score loop int matches 1.. run function ckr_player:bossbar/init_loop with storage ckr_player:io {}