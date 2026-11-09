#ckr_utils:pool_area/init
# 初始化pool_area模块

data modify storage ckr_utils:io spawn_plates set value []

scoreboard objectives add d dummy
scoreboard objectives add l dummy
scoreboard objectives add spawn_interval dummy
scoreboard objectives add spawn_timer dummy
scoreboard objectives add spawn_max dummy

function ckr_utils:pool_area/_consts

function ckr_utils:pool_area/_class

function ckr_utils:pool_area/init_operation