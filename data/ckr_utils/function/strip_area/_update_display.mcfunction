#ckr_utils:strip_area/_update_display
# 更新展示设置
# 传入世界实体为执行者
# 输出entity @e[tag=result,limit=1]

scoreboard players set nvec_x int 10000
scoreboard players set nvec_y int 0
scoreboard players set nvec_z int 0
scoreboard players operation scale_u int = l int
scoreboard players operation scale_u int > d int
execute if score d int > l int run scoreboard players operation nvec_x int >< nvec_z int
scoreboard players operation scale_u int *= 2 int
scoreboard players operation scale_v int = h int
scoreboard players operation scale_v int *= 2 int
scoreboard players set r int 0
scoreboard players set g int 127
scoreboard players set b int 255
scoreboard players set a int 127
function math:visual_plane/_model
data modify storage math:io input set from storage math:io result
data modify entity @s Pos set from storage math:io input.center
execute at @s run function math:visual_plane/_new
tag @e[tag=result,limit=1] add ckr_utils_strip_area_display

# 区块安全
tp @s 0 0 0