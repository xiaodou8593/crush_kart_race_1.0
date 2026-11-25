#ckr_player:guis/default/_set_slot_spec
# 设置特殊槽位物品
# 输入storage ckr_player:io input, {}代表空物品
# 传入玩家为执行者

function iframe:player_space/_get
data modify storage iframe:io player.slot_spec set from storage ckr_player:io input
function iframe:player_space/_store