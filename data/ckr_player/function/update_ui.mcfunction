#ckr_player:update_ui
# ckr_player:main_low调用

# 获取圈数数据
execute on vehicle on vehicle run function marker_control:data/_get
execute store result score temp_laps int run data get storage marker_control:io result.laps

# 获取血量和金币数据
function vp_core:player_space/_get
execute store result score temp_hp int run data get storage vp_core:io result.vehicle_hp
execute store result score temp_coins int run data get storage vp_core:io result.ckr_coins

# 更新bossbar显示
function ckr_player:bossbar/_update_name with storage vp_core:io result
#tellraw @a ["",{"text":"\ue000","font":"s3:default"},{"score":{"name":"temp_hp","objective":"int"}},{"text":"   "},{"text":"\ue001","font":"s3:default"},{"score":{"name":"temp_coins","objective":"int"}},{"text":"   "},{"text":"\ue006","font":"s3:default"},{"score":{"name":"temp_laps","objective":"int"}},{"text":"/"},{"score":{"name":"3","objective":"int"}}]

tag @s remove ckr_ui_update