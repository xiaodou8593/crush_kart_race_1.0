#ckr_vehicles:_full_hp_respawn
# 复活载具，回满血量
# 传入玩家为执行者

# 回满血量
function vp_core:player_space/_get
data modify storage vp_core:io result.vehicle_hp set from storage vp_core:io result.vehicle_mhp
function vp_core:player_space/_store
tag @s add ckr_ui_update

# 选择载具重生
scoreboard players operation tempid int = @s ckr_vehicle_slot
execute as @e[tag=ckr_vehicle] if score @s vve_id = tempid int run function ckr_vehicles:_respawn_async