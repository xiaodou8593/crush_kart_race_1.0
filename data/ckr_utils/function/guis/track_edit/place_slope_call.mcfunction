#ckr_utils:guis/track_edit/place_slope_call
# ckr_utils:guis/track_edit/place_slope调用

$function vve:slope_$(temp_0)$(temp_1)/_calc_chunk_range
$function vve:slope_$(temp_0)$(temp_1)/_calc_nvec
$function vve:slope_$(temp_0)$(temp_1)/_model
data modify storage vve:io input set from storage vve:io result
$function vve:slope_$(temp_0)$(temp_1)/_new
tag @e[tag=result,limit=1] add ckr_slope
function iframe:player_space/_get
execute store result score temp_cnt int run data get storage iframe:io player.slope_cnt
execute store result score @e[tag=result,limit=1] int store result storage iframe:io player.slope_cnt int 1 run scoreboard players add temp_cnt int 1
function iframe:player_space/_store

$execute as @e[tag=result,limit=1] run function vve:slope_$(temp_0)$(temp_1)/_get
tag @e[tag=result,limit=1] add tmp
$function vve:slope_$(temp_0)$(temp_1)/_update_display
tag @e[tag=result,limit=1] add ckr_slope_display
item replace entity @e[tag=result,limit=1] container.0 with glass
data modify entity @e[tag=tmp,limit=1] data.display_uuid set from entity @e[tag=result,limit=1] UUID
tag @e[tag=tmp] remove tmp