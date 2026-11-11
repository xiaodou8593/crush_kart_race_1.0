#ckr_vehicles:_full_hp_respawn
# 复活载具，回满血量
# 传入载具实例为执行者

# 选择玩家，回满血量
scoreboard players operation tempid int = @s vve_id
execute as @a[tag=vp_gamer] if score @s ckr_vehicle_slot = tempid int run tag @s add tmp
execute as @a[tag=tmp,limit=1] run function vp_core:player_space/_get
data modify storage vp_core:io result.vehicle_hp set from storage vp_core:io result.vehicle_mhp
execute as @a[tag=tmp,limit=1] run function vp_core:player_space/_store
tag @a[tag=tmp,limit=1] add ckr_ui_update
tag @a[tag=tmp,limit=1] remove tmp

# 载具重生
function ckr_vehicles:_respawn_async