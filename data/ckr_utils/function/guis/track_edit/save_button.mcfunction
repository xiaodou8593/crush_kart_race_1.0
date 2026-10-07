#ckr_utils:guis/track_edit/save_button
# ckr_utils:guis/track_edit/main调用

data modify storage ckr_utils:io temp set value {slope_plates:[],plane_plates:[]}
execute if entity @e[tag=ckr_slope,tag=!tmp,limit=1] run function ckr_utils:guis/track_edit/append_slope
execute if entity @e[tag=ckr_plane,tag=!tmp,limit=1] run function ckr_utils:guis/track_edit/append_plane
tag @e[tag=tmp] remove tmp

execute at @s run setblock ~ ~ ~ chest{Items:[{id:"minecraft:glass",count:1,slot:0,components:{"minecraft:custom_data":{track_data:{}}}}]}
execute at @s run data modify block ~ ~ ~ Items[0].components."minecraft:custom_data".track_data set from storage ckr_utils:io temp