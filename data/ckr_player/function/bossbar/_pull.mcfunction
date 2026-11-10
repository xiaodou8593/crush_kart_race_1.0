#ckr_player:bossbar/_pull
# 拉取一个bossbar显示
# 输出<res,int>, 是否拉取成功?1:0
# 传入玩家为执行者

scoreboard players set res int 1
execute unless data storage ckr_player:io free_bossbars[0] run return run scoreboard players set res int 0

function vp_core:player_space/_get
data modify storage vp_core:io result.bossbar_ptr set from storage ckr_player:io free_bossbars[0]
data modify storage ckr_player:io active_bossbars append from storage ckr_player:io free_bossbars[0]
data remove storage ckr_player:io free_bossbars[0]
function vp_core:player_space/_store