#ckr_vehicles:_drag_back
# 防止玩家下车
# 输入ckr载具实例为执行者

scoreboard players operation tempid int = @s vve_id
tag @e[tag=input] remove input
execute as @a[tag=vp_gamer] if score @s ckr_vehicle_slot = tempid int run tag @s add input
function vve_tutor:blue_car/_seat_on