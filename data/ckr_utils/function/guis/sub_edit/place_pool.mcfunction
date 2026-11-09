#ckr_utils:guis/sub_edit/place_pool
# ckr_utils:guis/sub_edit/main调用

execute as @e[tag=ckr_pool_point] run tag @s remove ckr_pool_point
function ckr_utils:pool_area/_shulker_to
function ckr_utils:pool_area/_model
data modify storage ckr_utils:io input set from storage ckr_utils:io result
function ckr_utils:pool_area/_new

function iframe:player_space/_get
execute store result score temp_cnt int run data get storage iframe:io player.pool_cnt
execute store result score @e[tag=result,limit=1] int store result storage iframe:io player.pool_cnt int 1 run scoreboard players add temp_cnt int 1
function iframe:player_space/_store

execute as @e[tag=result,limit=1] run function ckr_utils:pool_area/_get
execute as @e[tag=math_marker,limit=1] run function ckr_utils:pool_area/_update_display