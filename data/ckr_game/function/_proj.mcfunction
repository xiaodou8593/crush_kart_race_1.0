#ckr_game:_proj
# 把数据模板投射到临时对象
# 输入数据模板storage ckr_game:io input

data modify storage vp_core:io game_namespace set from storage ckr_game:io input.game_namespace
data modify storage vp_core:io game_prefix set from storage ckr_game:io input.game_prefix
data modify storage vp_core:io game_name set from storage ckr_game:io input.game_name
data modify storage vp_core:io game_desc set from storage ckr_game:io input.game_desc
data modify storage vp_core:io game_display set from storage ckr_game:io input.game_display
data modify storage vp_core:io version_range set from storage ckr_game:io input.version_range
data modify storage vp_core:io game_state set from storage ckr_game:io input.game_state
data modify storage vp_core:io field_size set from storage ckr_game:io input.field_size
data modify storage vp_core:io field_height set from storage ckr_game:io input.field_height
data modify storage vp_core:io field_center set from storage ckr_game:io input.field_center