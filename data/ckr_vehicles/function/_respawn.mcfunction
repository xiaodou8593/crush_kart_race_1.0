#ckr_vehicles:_respawn
# 载具回到重生点
# 传入载具实例为执行者

function marker_control:data/_get
function vve:vehicle/_get
execute store result score x int run data get storage marker_control:io result.respawn_pos[0] 10000
execute store result score y int run data get storage marker_control:io result.respawn_pos[1] 10000
execute store result score z int run data get storage marker_control:io result.respawn_pos[2] 10000
# 姿态修正
scoreboard players set nvec_x int 0
scoreboard players set nvec_y int 10000
scoreboard players set nvec_z int 0
function vve:object/_regular_jvec
# 清空动量
scoreboard players set vx int 0
scoreboard players set vy int 0
scoreboard players set vz int 0
# 角动量清空
scoreboard players set angular_x int 0
scoreboard players set angular_y int 0
scoreboard players set angular_z int 0
execute as 0-0-0-0-0 run function vve:object/_set_angular
function vve:vehicle/_store
function ckr_vehicles:_sync_motion