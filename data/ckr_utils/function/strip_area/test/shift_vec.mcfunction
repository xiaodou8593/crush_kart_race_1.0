#ckr_utils:strip_area/test/shift_vec

data modify storage ckr_utils:io list set value [{chunk_range: [-13.0d, 16.0d, -13.0d, 18.0d], coord: [-200.0d, -12.5d, 278.0d], size: [1.5d, 2.5d, 10.0d], run_func: "ckr_utils:strip_area/test/build_run"}, {chunk_range: [-4.0d, 0.0d, -4.0d, 3.0d], coord: [-60.5d, 12.5d, 25.5d], size: [1.0d, 4.5d, 24.0d], run_func: "ckr_utils:strip_area/test/build_run"}, {chunk_range: [8.0d, 2.0d, 9.0d, 2.0d], coord: [139.0d, -15.0d, 41.0d], size: [9.5d, 3.0d, 1.5d], run_func: "ckr_utils:strip_area/test/build_run"}, {chunk_range: [4.0d, 8.0d, 5.0d, 8.0d], coord: [81.5d, -9.0d, 133.5d], size: [12.0d, 3.0d, 1.0d], run_func: "ckr_utils:strip_area/test/build_run"}, {chunk_range: [-3.0d, 11.0d, -2.0d, 13.0d], coord: [-31.0d, -25.5d, 199.0d], size: [3.5d, 7.5d, 18.5d], run_func: "ckr_utils:strip_area/test/build_run"}]

execute store result score vec_x int run data get storage vp_core:io field_center[0] 10000
execute store result score vec_y int run data get storage vp_core:io field_center[1] 10000
execute store result score vec_z int run data get storage vp_core:io field_center[2] 10000
scoreboard players operation vec_x int *= -1 int
scoreboard players operation vec_y int *= -1 int
scoreboard players operation vec_z int *= -1 int

execute store result score loop int run data get storage ckr_utils:io list
execute if score loop int matches 1.. run function ckr_utils:strip_area/test/shift_vec_loop

tellraw @a {"nbt":"list","storage":"ckr_utils:io"}