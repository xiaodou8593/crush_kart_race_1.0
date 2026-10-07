#ckr_utils:guis/track_edit/exit
# ckr_utils:guis/track_edit/main调用

# 清理所有地形建模实体
kill @e[tag=ckr_slope]
kill @e[tag=ckr_plane]
kill @e[tag=ckr_slope_display]
kill @e[tag=ckr_plane_display]
kill @e[tag=ckr_slope_point]
kill @e[tag=ckr_plane_point]

kill @e[tag=ckr_del_point]

function iframe:_exit_inv