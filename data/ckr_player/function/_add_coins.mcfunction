#ckr_player:_add_coins
# 为玩家增加金币数量
# 输入<inp,int>
# 输出<res,int>
# 传入玩家为执行者

function vp_core:player_space/_get
execute store result score res int run data get storage vp_core:io result.ckr_coins
execute store result storage vp_core:io result.ckr_coins int 1 run scoreboard players operation res int += inp int
function vp_core:player_space/_store

tag @s add ckr_ui_update