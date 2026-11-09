#ckr_utils:guis/track_edit/_spawn_track
# 生成已保存轨道
# 输入storage ckr_utils:io input
# 以iframe player为执行者

kill @e[tag=ckr_plane]
kill @e[tag=ckr_slope]
kill @e[tag=ckr_plane_display]
kill @e[tag=ckr_slope_display]
execute as @e[tag=ckr_utils_wall_area] run function ckr_utils:wall_area/_delete_display_as
execute as @e[tag=ckr_utils_wall_area] run function ckr_utils:wall_area/_del
execute as @e[tag=ckr_utils_pool_area] run function ckr_utils:pool_area/_delete_display_as
execute as @e[tag=ckr_utils_pool_area] run function ckr_utils:pool_area/_del

# 缓存输入赛道
data modify storage ckr_utils:io temp_track set from storage ckr_utils:io input

# 调用平面构造器
scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_planes set from storage ckr_utils:io input.plane_plates
execute store result score planes_cnt int run data get storage ckr_utils:io list_planes
function ckr_utils:constructors/spawn_planes/_start
function ckr_utils:constructors/spawn_planes/_iter_all

tag @e[tag=vp_instance,tag=!vve_slope_display] add ckr_plane
tag @e[tag=vp_instance,tag=vve_slope_display] add ckr_plane_display
tag @e[tag=vp_instance] remove vp_instance

data modify storage ckr_utils:io input set from storage ckr_utils:io temp_track
# 调用斜面构造器
scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_slopes set from storage ckr_utils:io input.slope_plates
execute store result score slopes_cnt int run data get storage ckr_utils:io list_slopes
function ckr_utils:constructors/spawn_slopes/_start
function ckr_utils:constructors/spawn_slopes/_iter_all

tag @e[tag=vp_instance,tag=!vve_slope_display] add ckr_slope
tag @e[tag=vp_instance,tag=vve_slope_display] add ckr_slope_display
tag @e[tag=vp_instance] remove vp_instance

data modify storage ckr_utils:io input set from storage ckr_utils:io temp_track
# 调用条带构造器
scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_strips set from storage ckr_utils:io input.strip_plates
execute store result score strips_cnt int run data get storage ckr_utils:io list_strips
function ckr_utils:constructors/spawn_strips/_start
function ckr_utils:constructors/spawn_strips/_iter_all
tag @e[tag=vp_instance] remove vp_instance

data modify storage ckr_utils:io input set from storage ckr_utils:io temp_track
# 调用墙壁构造器
scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_walls set from storage ckr_utils:io input.wall_plates
execute store result score walls_cnt int run data get storage ckr_utils:io list_walls
function ckr_utils:constructors/spawn_walls/_start
function ckr_utils:constructors/spawn_walls/_iter_all
tag @e[tag=vp_instance] remove vp_instance

data modify storage ckr_utils:io input set from storage ckr_utils:io temp_track
# 调用刷怪区构造器
scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_pools set from storage ckr_utils:io input.pool_plates
execute store result score pools_cnt int run data get storage ckr_utils:io list_pools
function ckr_utils:constructors/spawn_pools/_start
function ckr_utils:constructors/spawn_pools/_iter_all
tag @e[tag=vp_instance] remove vp_instance

function iframe:player_space/_get
execute store result storage iframe:io player.slope_cnt int 1 if entity @e[tag=ckr_plane]
execute store result storage iframe:io player.plane_cnt int 1 if entity @e[tag=ckr_slope]
execute store result storage iframe:io player.pool_cnt int 1 if entity @e[tag=ckr_utils_pool_area]
execute store result storage iframe:io player.wall_cnt int 1 if entity @e[tag=ckr_utils_wall_area]
function iframe:player_space/_store