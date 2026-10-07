#ckr_game:_get_tp_points
# 获取ckr_game所有地图传送点的列表
# 占用temp{<loop,int>,<temp_x,int>,<temp_y,int>,<temp_z,int>,<temp_dx,int>,<temp_dy,int>,<temp_dz,int>}
# 输出storage ckr_game:io result

# 设置相对位置列表
data modify storage ckr_game:io result set value [\
	[0.0d,0.0d,0.0d]\
]

# 获取基准位置
execute store result score temp_x int run data get storage vp_core:io field_center[0] 10
execute store result score temp_y int run data get storage vp_core:io field_center[1] 10
execute store result score temp_z int run data get storage vp_core:io field_center[2] 10

# 相对位置与基准位置相加
execute store result score loop int run data get storage ckr_game:io result
execute if score loop int matches 1.. run function ckr_game:shift_tp_points