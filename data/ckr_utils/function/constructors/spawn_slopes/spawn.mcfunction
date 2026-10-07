#ckr_utils:constructors/spawn_slopes/spawn
# ckr_utils:constructors/spawn_slopes/_iter调用

$function $(module_prefix)_new
tag @e[tag=result,limit=1] add vp_instance
$execute as @e[tag=result,limit=1] run function $(module_prefix)_get
execute store result score vec_x int run data get storage vp_core:io field_center[0] 10000
execute store result score vec_y int run data get storage vp_core:io field_center[1] 10000
execute store result score vec_z int run data get storage vp_core:io field_center[2] 10000
$function $(module_prefix)_shift_vec
$execute as @e[tag=result,limit=1] run function $(module_prefix)_store
$function $(module_prefix)_update_display
item replace entity @e[tag=result,limit=1] container.0 with minecraft:glass
tag @e[tag=result,limit=1] add vp_instance