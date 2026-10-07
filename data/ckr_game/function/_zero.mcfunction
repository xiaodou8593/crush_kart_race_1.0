#ckr_game:_zero
# 把临时对象的全部数据置0

data modify storage vp_core:io game_namespace set value ""
data modify storage vp_core:io game_prefix set value ""
data modify storage vp_core:io game_name set value {}
data modify storage vp_core:io game_desc set value []
data modify storage vp_core:io game_display set value {}
data modify storage vp_core:io version_range set value [0, 0]
data modify storage vp_core:io game_state set value ""
data modify storage vp_core:io field_size set value 0
data modify storage vp_core:io field_height set value 0
data modify storage vp_core:io field_center set value [0.0d, 0.0d, 0.0d]