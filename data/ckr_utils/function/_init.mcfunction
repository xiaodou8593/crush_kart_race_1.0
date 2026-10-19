#ckr_utils:_init
# 初始化各工具模块

scoreboard players set -100 int -100
scoreboard players set 20000 int 20000
scoreboard players set 30000 int 30000

data modify storage ckr_utils:io rec set value [{}]

function ckr_utils:constructors/spawn_slopes/init
function ckr_utils:constructors/spawn_planes/init
function ckr_utils:constructors/spawn_strips/init
function ckr_utils:strip_area/init