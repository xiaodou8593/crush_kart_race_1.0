#ckr_game:_model
# 使用临时对象构建数据模板
# 输出数据模板storage ckr_game:io result

data modify storage ckr_game:io result set value {game_namespace:"", game_prefix:"", game_name:{}, game_desc:[], game_display:{}, version_range:[0, 0], game_state:"", field_size:0, field_height:0, field_center:[0.0d, 0.0d, 0.0d]}

data modify storage ckr_game:io result.game_namespace set from storage vp_core:io game_namespace
data modify storage ckr_game:io result.game_prefix set from storage vp_core:io game_prefix
data modify storage ckr_game:io result.game_name set from storage vp_core:io game_name
data modify storage ckr_game:io result.game_desc set from storage vp_core:io game_desc
data modify storage ckr_game:io result.game_display set from storage vp_core:io game_display
data modify storage ckr_game:io result.version_range set from storage vp_core:io version_range
data modify storage ckr_game:io result.game_state set from storage vp_core:io game_state
data modify storage ckr_game:io result.field_size set from storage vp_core:io field_size
data modify storage ckr_game:io result.field_height set from storage vp_core:io field_height
data modify storage ckr_game:io result.field_center set from storage vp_core:io field_center