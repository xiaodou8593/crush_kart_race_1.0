#ckr_utils:guis/track_edit/_spawn_track
# 生成已保存轨道
# 输入storage ckr_utils:io input
# 以iframe player为执行者

kill @e[tag=ckr_plane]
kill @e[tag=ckr_slope]
kill @e[tag=ckr_plane_display]
kill @e[tag=ckr_slope_display]

# 调用平面构造器
scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_planes set from storage ckr_utils:io input.plane_plates
execute store result score planes_cnt int run data get storage ckr_utils:io list_planes
function ckr_utils:constructors/spawn_planes/_start
function ckr_utils:constructors/spawn_planes/_iter_all

tag @e[tag=vp_instance,tag=!vve_slope_display] add ckr_plane
tag @e[tag=vp_instance,tag=vve_slope_display] add ckr_plane_display
tag @e[tag=vp_instance] remove vp_instance

# 调用斜面构造器
scoreboard players set vp_progress int 0
data modify storage ckr_utils:io list_slopes set from storage ckr_utils:io input.slope_plates
execute store result score slopes_cnt int run data get storage ckr_utils:io list_slopes
function ckr_utils:constructors/spawn_slopes/_start
function ckr_utils:constructors/spawn_slopes/_iter_all

tag @e[tag=vp_instance,tag=!vve_slope_display] add ckr_slope
tag @e[tag=vp_instance,tag=vve_slope_display] add ckr_slope_display
tag @e[tag=vp_instance] remove vp_instance

function iframe:player_space/_get
execute store result storage iframe:io player.slope_cnt int 1 if entity @e[tag=ckr_plane]
execute store result storage iframe:io player.plane_cnt int 1 if entity @e[tag=ckr_slope]
function iframe:player_space/_store