#ckr_utils:constructors/spawn_vehicles/spawn_a_vehicle
# ckr_utils:constructors/spawn_vehicles/_iter调用

$data modify storage $(namespace):io input set from storage $(namespace):class $(module_name)_plate
$function $(module_prefix)_proj
function ckr_utils:constructors/spawn_vehicles/_pop
scoreboard players operation x int = vec_x int
scoreboard players operation y int = vec_y int
scoreboard players operation z int = vec_z int
scoreboard players set angular_x int 0
scoreboard players set angular_y int 0
scoreboard players set angular_z int 0
function vve:object/_set_angular
# 构造新的车辆数据模板，生成车辆
$function $(module_prefix)_model
$data modify storage $(namespace):io input set from storage $(namespace):io result

$data modify entity @s Pos set from storage $(namespace):io input.center
$execute at @s run function $(module_prefix)_new
# 区块安全
tp @s 0 0 0

tag @e[tag=result,limit=1] add vp_instance
tag @e[tag=result,limit=1] add ckr_vehicle