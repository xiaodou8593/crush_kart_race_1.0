#ckr_utils:build_test_track
# ckr_utils:_build_test_track调用

function marker_control:data/_get
data modify entity 0-0-0-0-1 Thrower set from storage marker_control:io result.uuid
data modify storage ckr_utils:io input set from storage ckr_game:io list_tracks[0]
execute as 0-0-0-0-1 on origin run function ckr_utils:guis/track_edit/_spawn_track

execute as @e[tag=vve_slope_display] run data modify entity @s brightness set value {sky:15,block:15}