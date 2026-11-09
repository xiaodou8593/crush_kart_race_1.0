#ckr_vehicles:respawn_async_main
# ckr_vehicles:_respawn_async异步调用

execute as @e[tag=ckr_vehicle_repawn] run function ckr_vehicles:_respawn
tag @e[tag=ckr_vehicle_repawn] remove ckr_vehicle_repawn