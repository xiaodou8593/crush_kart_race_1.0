#ckr_utils:constructors/spawn_vehicles/test/shift

data modify storage ckr_utils:io input set value {vehicles_cnt: 0, xyzw: [0.0d, 0.0d, 0.0d, 1.0d], start_xyzw: [-2.0E-4d, -0.7169d, -2.0E-4d, 0.6971d], center: [-56.0d, -34.0d, 185.5d], range: [3.0d, 3.0d], orth_xyzw: [0.7169d, -2.0E-4d, 0.6971d, 2.0E-4d], vp_progress: 0, ivec: [1.0d, 0.0d, 0.0d], quat_phi: 0, jvec: [0.0d, 1.0d, 0.0d], kvec: [0.0d, 0.0d, 1.0d], list_uuids: [], field_center: [-63.5d, -41.0d, 152.0d]}
function ckr_utils:constructors/spawn_vehicles/_proj
data modify storage vp_core:io field_center set value [-63.5d, -41.0d, 152.0d]
execute store result score vec_x int run data get storage vp_core:io field_center[0] 10000
execute store result score vec_y int run data get storage vp_core:io field_center[1] 10000
execute store result score vec_z int run data get storage vp_core:io field_center[2] 10000
scoreboard players operation vec_x int *= -1 int
scoreboard players operation vec_y int *= -1 int
scoreboard players operation vec_z int *= -1 int
function ckr_utils:constructors/spawn_vehicles/_shift_vec
function ckr_utils:constructors/spawn_vehicles/_print_plate