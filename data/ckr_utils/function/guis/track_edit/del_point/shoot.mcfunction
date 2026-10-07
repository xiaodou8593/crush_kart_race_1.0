#ckr_utils:guis/track_edit/del_point/shoot

# 获取发射起点
execute at @s anchored eyes run tp @e[tag=math_marker,limit=1] ^ ^ ^0.5
data modify storage math:io xyz set from entity @e[tag=math_marker,limit=1] Pos
execute store result score x int run data get storage math:io xyz[0] 10000
execute store result score y int run data get storage math:io xyz[1] 10000
execute store result score z int run data get storage math:io xyz[2] 10000

# 获取速度向量
execute at @s positioned 0.0 0.0 0.0 run tp @e[tag=math_marker,limit=1] ^ ^ ^0.3
data modify storage math:io xyz set from entity @e[tag=math_marker,limit=1] Pos
execute store result score vx int run data get storage math:io xyz[0] 10000
execute store result score vy int run data get storage math:io xyz[1] 10000
execute store result score vz int run data get storage math:io xyz[2] 10000

function vve:point/_model
data modify storage vve:io input set from storage vve:io result
data modify entity @e[tag=math_marker,limit=1] Pos set from storage vve:io input.center
execute at @e[tag=math_marker,limit=1] run function vve:point/_new
tag @e[tag=result,limit=1] add ckr_del_point
item replace entity @e[tag=result,limit=1] container.0 with iron_block
scoreboard players set @e[tag=result,limit=1] killtime 50