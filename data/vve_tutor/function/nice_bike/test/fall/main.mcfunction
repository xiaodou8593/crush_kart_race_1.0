#vve_tutor:nice_bike/test/fall/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_tutor:nice_bike/_get
#function vve_tutor:nice_bike/_model
#execute store result storage vve_tutor:io frame int 1 run scoreboard players get test_n int
#function vve_tutor:nice_bike/test/fall/store_frame with storage vve_tutor:io {}

function vve_tutor:nice_bike/main_c

scoreboard players add test_n int 1