#ckr_player:guis/default/_set_slot_2
# 设置普通槽位2物品
# 输入storage ckr_player:io input, {}代表空物品
# 传入玩家为执行者

function iframe:player_space/_get
data modify storage iframe:io player.slot_2 set from storage ckr_player:io input
function iframe:player_space/_store