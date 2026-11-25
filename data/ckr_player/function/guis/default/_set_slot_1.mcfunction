#ckr_player:guis/default/_set_slot_1
# 设置普通槽位1物品
# 输入storage ckr_player:io input, {}代表空物品
# 传入玩家为执行者

function iframe:player_space/_get
data modify storage iframe:io player.slot_1 set from storage ckr_player:io input
function iframe:player_space/_store