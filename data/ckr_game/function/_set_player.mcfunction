#ckr_game:_set_player
# 初始化一名ckr_game玩家
# 输入玩家为执行者

# 死亡/复活设置
function vp_core:player_space/_get
data modify storage vp_core:io result.death_func set value "ckr_game:death_func"
data modify storage vp_core:io result.respawn_func set value "ckr_game:respawn_func"
data modify storage vp_core:io result.ckr_coins set value 0
function vp_core:player_space/_store

# 骑乘自己的载具
scoreboard players operation tempid int = @s ckr_vehicle_slot
execute as @e[tag=vve_tutor_blue_car] if score @s vve_id = tempid int run tag @s add tmp
tag @s add input
execute as @e[tag=tmp,limit=1] run function vve_tutor:blue_car/_seat_on
tag @e[tag=tmp] remove tmp