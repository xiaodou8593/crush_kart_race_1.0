#ckr_player:bossbar/_pull
# 拉取一个bossbar显示
# 输出<res,int>, 是否拉取成功?1:0
# 传入玩家为执行者

scoreboard players set res int 1
execute unless data storage ckr_player:io free_bossbars[0] run return run scoreboard players set res int 0

# 获取圈数数据
execute on vehicle on vehicle run function marker_control:data/_get
execute store result score temp_laps int run data get storage marker_control:io result.laps

function vp_core:player_space/_get
data modify storage vp_core:io result.bossbar_ptr set from storage ckr_player:io free_bossbars[0]
data modify storage ckr_player:io active_bossbars append from storage ckr_player:io free_bossbars[0]
data remove storage ckr_player:io free_bossbars[0]
# 获取血量，最大血量，金币数
execute store result score temp_hp int run data get storage vp_core:io result.vehicle_hp
execute store result score temp_mhp int run data get storage vp_core:io result.vehicle_mhp
execute store result score temp_coins int run data get storage vp_core:io result.ckr_coins
function vp_core:player_space/_store

function ckr_player:bossbar/pull_this with storage vp_core:io result

# 更新bossbar显示
function ckr_player:bossbar/_update_name