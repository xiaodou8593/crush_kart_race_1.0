#ckr_utils:guis/track_edit/place_plane
# ckr_utils:guis/track_edit/main调用

data modify storage math:io xyz set from entity @e[tag=ckr_plane_point,limit=1] Pos
kill @e[tag=ckr_plane_point,limit=1]
execute store result score temp_x_1 int run data get storage math:io xyz[0] 10000
execute store result score temp_y_1 int run data get storage math:io xyz[1] 10000
execute store result score temp_z_1 int run data get storage math:io xyz[2] 10000

data modify storage math:io xyz set from entity @e[tag=ckr_plane_point,limit=1] Pos
kill @e[tag=ckr_plane_point,limit=1]
execute store result score temp_x_2 int run data get storage math:io xyz[0] 10000
execute store result score temp_y_2 int run data get storage math:io xyz[1] 10000
execute store result score temp_z_2 int run data get storage math:io xyz[2] 10000

kill @e[tag=ckr_plane_point]

# 设置水平范围
scoreboard players operation x_min int = temp_x_1 int
scoreboard players operation x_max int = temp_x_2 int
execute if score x_max int < x_min int run scoreboard players operation x_min int >< x_max int
scoreboard players operation z_min int = temp_z_1 int
scoreboard players operation z_max int = temp_z_2 int
execute if score z_max int < z_min int run scoreboard players operation z_min int >< z_max int

# 设置y坐标
scoreboard players operation y int = temp_y_1 int

# 设置基底厚度
scoreboard players set base_layer int 10000

function vve:plane/_calc_chunk_range
function vve:plane/_calc_nvec
function vve:plane/_model
data modify storage vve:io input set from storage vve:io result
function vve:plane/_new
tag @e[tag=result,limit=1] add ckr_plane
function iframe:player_space/_get
execute store result score temp_cnt int run data get storage iframe:io player.plane_cnt
execute store result score @e[tag=result,limit=1] int store result storage iframe:io player.plane_cnt int 1 run scoreboard players add temp_cnt int 1
function iframe:player_space/_store

execute as @e[tag=result,limit=1] run function vve:plane/_get
tag @e[tag=result,limit=1] add tmp
function vve:plane/_update_display
tag @e[tag=result,limit=1] add ckr_plane_display
item replace entity @e[tag=result,limit=1] container.0 with glass
data modify entity @e[tag=tmp,limit=1] data.display_uuid set from entity @e[tag=result,limit=1] UUID
tag @e[tag=tmp] remove tmp