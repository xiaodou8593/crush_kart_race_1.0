#ckr_utils:constructors/spawn_vehicles/test/display/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

function ckr_utils:constructors/spawn_vehicles/_get
execute as @e[tag=math_marker,limit=1] run function ckr_utils:constructors/spawn_vehicles/_render
function ckr_utils:constructors/spawn_vehicles/_store
#function ckr_utils:constructors/spawn_vehicles/_model
#execute store result storage ckr_utils:io frame int 1 run scoreboard players get test_n int
#function ckr_utils:constructors/spawn_vehicles/test/display/store_frame with storage ckr_utils:io {}

#scoreboard players set test int 1
scoreboard players add test_n int 1