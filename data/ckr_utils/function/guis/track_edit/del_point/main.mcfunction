#ckr_utils:guis/track_edit/del_point/main

function vve:point/_get
# 运动学迭代
function vve:point/_iter_motion
# 介质探测
function vve:point/_get_cpoint
scoreboard players set c_mass int 1
execute as 0-0-0-0-0 run function vve:cpoint/_topos
execute as 0-0-0-0-0 at @s run function ckr_utils:guis/track_edit/del_point/_detect_element
# 运动同步
function vve:point/_sync_motion
function vve:point/_store

execute if score material_response int matches 1.. run kill @s