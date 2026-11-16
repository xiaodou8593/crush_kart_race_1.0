#ckr_player:bossbar/update_name/11
# ckr_player:bossbar/_update_name调用

bossbar set ckr_player:bossbar_11 name ["",{"text":"\ue000","font":"s3:default"},{"score":{"name":"temp_hp","objective":"int"}},{"text":"   "},{"text":"\ue001","font":"s3:default"},{"score":{"name":"temp_coins","objective":"int"}},{"text":"   "},{"text":"\ue006","font":"s3:default"},{"score":{"name":"temp_laps","objective":"int"}},{"text":"/"},{"score":{"name":"3","objective":"int"}}]
execute store result bossbar ckr_player:bossbar_11 value run scoreboard players get temp_hp int
execute store result bossbar ckr_player:bossbar_11 max run scoreboard players get temp_mhp int