#ckr_utils:constructors/spawn_planes/_iter
# 临时对象运行一次构造迭代
# 输出entity @e[tag=vp_instance]

data modify storage vve:io input set from storage ckr_utils:io list_planes[0]
data remove storage ckr_utils:io list_planes[0]

# 实例化平面
function vve:plane/_new
tag @e[tag=result,limit=1] add vp_instance
execute as @e[tag=result,limit=1] run function vve:plane/_get
execute store result score vec_x int run data get storage vp_core:io field_center[0] 10000
execute store result score vec_y int run data get storage vp_core:io field_center[1] 10000
execute store result score vec_z int run data get storage vp_core:io field_center[2] 10000
function vve:plane/_shift_vec
execute as @e[tag=result,limit=1] run function vve:plane/_store
function vve:plane/_update_display
item replace entity @e[tag=result,limit=1] container.0 with minecraft:glass
tag @e[tag=result,limit=1] add vp_instance

# 计算构造进度
execute store result score vp_progress int run data get storage ckr_utils:io list_planes
scoreboard players operation vp_progress int -= planes_cnt int
scoreboard players operation vp_progress int *= -1 int
scoreboard players operation @e[tag=result,limit=1] int = vp_progress int
scoreboard players operation vp_progress int *= 100 int
scoreboard players operation vp_progress int /= planes_cnt int
scoreboard players operation vp_progress int > 1 int