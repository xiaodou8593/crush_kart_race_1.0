#ckr_utils:guis/track_edit/del_point/_detect_element
# 自定义介质探测
# 输入执行位置
# 输入cpoint{...}
# 输出介质响应(各模块的临时对象)
# 传入世界实体为执行者(不保证Pos位于执行位置)

# 各模块响应信号重置
scoreboard players set shift_response int 0
scoreboard players set impulse_response int 0
scoreboard players set friction_response int 10000
scoreboard players set grab_layer_response int 0
scoreboard players set bounce_layer_response int 0
scoreboard players set material_response int 0
scoreboard players set surface_response int 0

# 斜面介质
# 获取区块坐标
scoreboard players operation chunk_x int = c_x int
scoreboard players operation chunk_z int = c_z int
scoreboard players operation chunk_x int /= 10000 int
scoreboard players operation chunk_z int /= 10000 int
scoreboard players operation chunk_x int /= 16 int
scoreboard players operation chunk_z int /= 16 int
# 区块查询
execute as @e[x=0,y=8,z=0,distance=..1,predicate=vve:match_chunk] run function ckr_utils:guis/track_edit/del_point/call_material