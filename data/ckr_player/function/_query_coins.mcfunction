#ckr_player:_query_coins
# 查询玩家金币数量
# 输出<res,int>
# 传入玩家为执行者

function vp_core:player_space/_get
execute store result score res int run data get storage vp_core:io result.ckr_coins