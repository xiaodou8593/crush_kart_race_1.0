#vve_tutor:hi_plane/main_sync
# vve_tutor:hi_plane/tick调用
# 实体对象主程序

function vve_tutor:hi_plane/_get
# 运动同步
function vve:object/_sync_motion
function vve_tutor:hi_plane/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_tutor:hi_plane/_del