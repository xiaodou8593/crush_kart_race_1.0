#ckr_utils:constructors/spawn_vehicles/_iter
# 临时对象运行一次构造迭代
# 输出entity @e[tag=vp_instance]

# 获取序号，计算坐标
scoreboard players operation res int = d int
scoreboard players operation res int *= l int
execute store result score inp int run data get storage ckr_utils:io list_uuids
scoreboard players operation inp int -= vehicles_cnt int
scoreboard players operation inp int *= -1 int
scoreboard players add inp int 1
scoreboard players operation res int -= inp int
execute store result score u int store result score v int run scoreboard players operation res int > 0 int
scoreboard players operation u int %= d int
scoreboard players operation v int /= d int
scoreboard players operation u int *= 20000 int
scoreboard players operation v int *= 30000 int
scoreboard players add u int 10000
scoreboard players set v int 0
function math:uvw/_tovec_high

function ckr_utils:constructors/spawn_vehicles/_push
function ckr_utils:constructors/spawn_vehicles/_push
# 根据list_uuids[0]投射车辆的数据模板
data modify storage vve_tutor:io input set from storage vve_tutor:class blue_car_plate
function vve_tutor:blue_car/_proj
function ckr_utils:constructors/spawn_vehicles/_pop
scoreboard players operation x int = vec_x int
scoreboard players operation y int = vec_y int
scoreboard players operation z int = vec_z int
scoreboard players set angular_x int 0
scoreboard players set angular_y int 0
scoreboard players set angular_z int 0
function vve:object/_set_angular
# 构造新的车辆数据模板，生成车辆
function vve_tutor:blue_car/_model
data modify storage vve_tutor:io input set from storage vve_tutor:io result
data modify entity @s Pos set from storage vve_tutor:io input.center
execute at @s run function vve_tutor:blue_car/_new
# 区块安全
tp @s 0 0 0
tag @e[tag=result,limit=1] add vp_instance
function ckr_utils:constructors/spawn_vehicles/_pop

# 移除list_uuids[0]
data modify entity 0-0-0-0-1 Thrower set from storage ckr_utils:io list_uuids[0]
data remove storage ckr_utils:io list_uuids[0]

# 建立记分板指针
execute as @e[tag=result,limit=1] run function vve:id/_pull
scoreboard players operation tempid int = @e[tag=result,limit=1] vve_id
execute as 0-0-0-0-1 on origin run scoreboard players operation @s ckr_vehicle_slot = tempid int

# 计算构造进度
execute store result score vp_progress int run data get storage ckr_utils:io list_uuids
scoreboard players operation vp_progress int -= vehicles_cnt int
scoreboard players operation vp_progress int *= -1 int
scoreboard players operation @e[tag=result,limit=1] int = vp_progress int
scoreboard players operation vp_progress int *= 100 int
scoreboard players operation vp_progress int /= vehicles_cnt int
scoreboard players operation vp_progress int > 1 int