#ckr_utils:strip_area/test/build
# 测试建造

kill @e[tag=ckr_utils_strip_area]
kill @e[tag=ckr_utils_strip_area_display]
scoreboard players set x int -2000000
scoreboard players set y int -125000
scoreboard players set z int 2780000
function ckr_utils:strip_area/_calc_chunk_range
scoreboard players set d int 15000
scoreboard players set h int 25000
scoreboard players set l int 100000
data modify storage ckr_utils:io run_func set value "ckr_utils:strip_area/test/build_run"
function ckr_utils:strip_area/_model
data modify storage ckr_utils:io input set from storage ckr_utils:io result
function ckr_utils:strip_area/_new
execute as @e[tag=result,limit=1] run function ckr_utils:strip_area/_get
execute as 0-0-0-0-0 run function ckr_utils:strip_area/_update_display