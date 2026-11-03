#ckr_vehicles:_respawn
# 载具回到重生点
# 传入载具实例为执行者

function marker_control:data/_get
function vve:vehicle/_get
execute store result score x int run data get storage marker_control:io result.respawn_pos[0] 10000
execute store result score y int run data get storage marker_control:io result.respawn_pos[1] 10000
execute store result score z int run data get storage marker_control:io result.respawn_pos[2] 10000
function vve:vehicle/_store
function ckr_vehicles:_sync_motion