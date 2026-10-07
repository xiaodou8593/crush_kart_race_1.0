#ckr_game:_reg
# 注册ckr_game到vp_core

function ckr_game:_zero
# 设置模块基本信息
data modify storage vp_core:io game_namespace set value "ckr_game"
data modify storage vp_core:io game_prefix set value "ckr_game:"
data modify storage vp_core:io game_name set value {text:"crush kart race",color:"aqua"}
data modify storage vp_core:io game_desc set value [\
	{text:"example_description",color:"gray"},\
]
data modify storage vp_core:io game_display set value {\
	item_icon:{id:"minecraft:grass_block",count:1b},\
	head_pic:{id:"minecraft:structure_void",count:1b,components:{"minecraft:item_model":""}},\
}
data modify storage vp_core:io version_range set value [0,10000]
data modify storage vp_core:io game_state set value "preparing"
data modify storage vp_core:io field_size set value 9
data modify storage vp_core:io field_height set value 2
data modify storage vp_core:io field_center set value [1000.0d,-41.0d,0.0d]
# 将模块基本信息导出为数据模板
function ckr_game:_model

# 将数据模板注入到vp_core
data modify storage vp_core:class list_games append from storage ckr_game:io result