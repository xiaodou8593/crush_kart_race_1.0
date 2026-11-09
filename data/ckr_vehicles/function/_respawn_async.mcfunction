#ckr_vehicles:_respawn_async
# 异步调用ckr_vehicles:_respawn

execute if entity @s[tag=ckr_vehicle_repawn] run return fail
tag @s add ckr_vehicle_repawn
schedule function ckr_vehicles:respawn_async_main 1t replace