#vve_tutor:nice_bike/test/inter_bounce/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~-1 ~-2 ~3 ~-1 ~2 air

execute as @e[tag=vve_tutor_nice_bike,tag=test] run function vve_tutor:nice_bike/_del