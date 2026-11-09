#ckr_player:_print_coins
# 打印玩家金币数量
# 输出<res,int>
# 传入玩家为执行者

function ckr_player:_query_coins
tellraw @a ["coins: ", {"score":{"name":"res","objective":"int"}}]