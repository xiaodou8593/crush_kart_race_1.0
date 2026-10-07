#vve_tutor:nice_bike/test/cp/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_tutor:nice_bike/_get
#function vve_tutor:nice_bike/_model
#execute store result storage vve_tutor:io frame int 1 run scoreboard players get test_n int
#function vve_tutor:nice_bike/test/cp/store_frame with storage vve_tutor:io {}

function vve_tutor:nice_bike/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion
# 介质探测
scoreboard players set r int 255
scoreboard players set g int 0
scoreboard players set b int 0
data modify storage math:io render_command set value "function math:rgb/_render_debug_3"
#data modify storage math:io render_command set from storage math:class particle_commands.red_dust
execute as 0-0-0-0-0 run function vve_tutor:nice_bike/_iter_cpoints_render
# 运动同步
function vve_tutor:nice_bike/_store
function vve_tutor:nice_bike/main_sync

scoreboard players add test_n int 1