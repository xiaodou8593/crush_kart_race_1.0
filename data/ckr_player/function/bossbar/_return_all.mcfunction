#ckr_player:bossbar/_return_all
# 返还所有bossbar

# 遍历每个显示中的bossbar
execute store result score loop int run data get storage ckr_player:io active_bossbars
execute if score loop int matches 1.. run function ckr_player:bossbar/return_loop

data modify storage ckr_player:io free_bossbars append from storage ckr_player:io active_bossbars[]
data modify storage ckr_player:io active_bossbars set value []