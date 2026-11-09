#ckr_game:_build_async_start
# 开始构造游戏实例

# 设置游戏时间
gamerule advance_time false
time set 22255

# vp_joiner观看游戏实例构造过程（如果区块过多，性能压力较大，该片段可删除！）
gamemode spectator @a[tag=vp_joiner]
execute as @e[tag=math_marker,limit=1] run function ckr_game:watch_build

# 确保模拟器处于停止运行状态
function vve_tutor:simulator/_stop

# 设置虚空线
#scoreboard players set plane_y int -500000
execute store result score plane_y int run data get storage ckr_game:io list_tracks[0].plane_y 10000

# 生成chunk_loader构造器
data modify storage vp_core:io input set from storage vp_core:class chunk_loader_plate
execute store result score temp_size int run data get storage vp_core:io field_size
execute store result score temp_height int run data get storage vp_core:io field_height
execute store result storage vp_core:io input.field_size int 1 run scoreboard players add temp_size int 1
execute store result storage vp_core:io input.field_height int 1 run scoreboard players add temp_height int 1
data modify storage vp_core:io input.field_center set from storage vp_core:io field_center
function vp_core:constructors/chunk_loader/_new

# 生成area_clear构造器
data modify storage vp_core:io input set from storage vp_core:class area_clear_plate
execute store result score temp_size int run data get storage vp_core:io field_size
execute store result score temp_height int run data get storage vp_core:io field_height
execute store result storage vp_core:io input.field_size int 1 run scoreboard players add temp_size int 1
execute store result storage vp_core:io input.field_height int 1 run scoreboard players add temp_height int 1
data modify storage vp_core:io input.field_center set from storage vp_core:io field_center
function vp_core:constructors/area_clear/_new

# 生成spawn_planes构造器
data modify storage ckr_utils:io input set from storage ckr_utils:class spawn_planes_plate
data modify storage ckr_utils:io input.list_planes set from storage ckr_game:io list_tracks[0].plane_plates
execute store result storage ckr_utils:io input.planes_cnt int 1 run data get storage ckr_utils:io input.list_planes
data modify storage ckr_utils:io input.field_center set from storage vp_core:io field_center
function ckr_utils:constructors/spawn_planes/_new
execute unless data storage ckr_utils:io input.list_planes[0] run kill @e[tag=result,limit=1]

# 生成spawn_slopes构造器
data modify storage ckr_utils:io input set from storage ckr_utils:class spawn_slopes_plate
data modify storage ckr_utils:io input.list_slopes set from storage ckr_game:io list_tracks[0].slope_plates
execute store result storage ckr_utils:io input.slopes_cnt int 1 run data get storage ckr_utils:io input.list_slopes
data modify storage ckr_utils:io input.field_center set from storage vp_core:io field_center
function ckr_utils:constructors/spawn_slopes/_new
execute unless data storage ckr_utils:io input.list_slopes[0] run kill @e[tag=result,limit=1]

# 生成spawn_strips构造器
data modify storage ckr_utils:io input set from storage ckr_utils:class spawn_strips_plate
data modify storage ckr_utils:io input.list_strips set from storage ckr_game:io list_tracks[0].strip_plates
execute store result storage ckr_utils:io input.strips_cnt int 1 store result score strips_cnt int run data get storage ckr_utils:io input.list_strips
data modify storage ckr_utils:io input.field_center set from storage vp_core:io field_center
function ckr_utils:constructors/spawn_strips/_new
execute unless data storage ckr_utils:io input.list_strips[0] run kill @e[tag=result,limit=1]

# 生成spawn_walls构造器
data modify storage ckr_utils:io input set from storage ckr_utils:class spawn_walls_plate
data modify storage ckr_utils:io input.list_walls set from storage ckr_game:io list_tracks[0].wall_plates
execute store result storage ckr_utils:io input.walls_cnt int 1 run data get storage ckr_utils:io input.list_walls
data modify storage ckr_utils:io input.field_center set from storage vp_core:io field_center
function ckr_utils:constructors/spawn_walls/_new
execute unless data storage ckr_utils:io input.list_walls[0] run kill @e[tag=result,limit=1]

# 生成spawn_pools构造器
data modify storage ckr_utils:io input set from storage ckr_utils:class spawn_pools_plate
data modify storage ckr_utils:io input.list_pools set from storage ckr_game:io list_tracks[0].pool_plates
execute store result storage ckr_utils:io input.pools_cnt int 1 run data get storage ckr_utils:io input.list_pools
data modify storage ckr_utils:io input.field_center set from storage vp_core:io field_center
function ckr_utils:constructors/spawn_pools/_new
execute unless data storage ckr_utils:io input.list_pools[0] run kill @e[tag=result,limit=1]

# 生成spawn_vehicles构造器
data modify storage ckr_utils:io input set from storage ckr_game:io list_tracks[0].spawn_vehicles_plate
function ckr_utils:constructors/spawn_vehicles/_proj
execute store result score vec_x int run data get storage vp_core:io field_center[0] 10000
execute store result score vec_y int run data get storage vp_core:io field_center[1] 10000
execute store result score vec_z int run data get storage vp_core:io field_center[2] 10000
function ckr_utils:constructors/spawn_vehicles/_shift_vec
function ckr_utils:constructors/spawn_vehicles/_model
data modify storage ckr_utils:io input set from storage ckr_utils:io result
execute as @a[tag=vp_joiner] run data modify storage ckr_utils:io input.list_uuids append from entity @s UUID
execute store result storage ckr_utils:io input.vehicles_cnt int 1 run data get storage ckr_utils:io input.list_uuids
function ckr_utils:constructors/spawn_vehicles/_new

# 生成iter_vehicles构造器
data modify storage ckr_utils:io input set from storage ckr_utils:class iter_vehicles_plate
function ckr_utils:constructors/iter_vehicles/_new

# 生成vehicle_setup构造器
data modify storage vp_core:io input set from storage ckr_utils:class vehicle_setup_plate
function ckr_utils:constructors/vehicle_setup/_new

# 生成player_setup构造器
data modify storage vp_core:io input set from storage vp_core:class player_setup_plate
data modify storage vp_core:io input.player_set_func set value "ckr_game:_set_player"
function vp_core:constructors/player_setup/_new

# 转动赛道列表
function ckr_game:_next_track

# 调用构造主程序
schedule function ckr_game:_build_async_main 1t replace