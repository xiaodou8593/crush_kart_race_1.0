#ckr_utils:strip_area/init
# 初始化strip_area模块

data modify storage ckr_utils:io run_func set value ""

scoreboard objectives add chunk_x_min dummy
scoreboard objectives add chunk_z_min dummy
scoreboard objectives add chunk_x_max dummy
scoreboard objectives add chunk_z_max dummy
scoreboard objectives add d dummy
scoreboard objectives add h dummy
scoreboard objectives add l dummy
scoreboard objectives add index dummy
scoreboard objectives add respawn_x dummy
scoreboard objectives add respawn_y dummy
scoreboard objectives add respawn_z dummy

function ckr_utils:strip_area/_consts

function ckr_utils:strip_area/_class

function ckr_utils:strip_area/init_operation