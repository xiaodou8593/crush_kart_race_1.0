#ckr_player:bossbar/_return_all
# 返还所有bossbar

data modify storage ckr_player:io free_bossbars append from storage ckr_player:io active_bossbars[]
data modify storage ckr_player:io active_bossbars set value []