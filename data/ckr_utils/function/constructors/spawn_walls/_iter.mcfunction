#ckr_utils:constructors/spawn_walls/_iter
# 临时对象运行一次构造迭代
# 输出entity @e[tag=vp_instance]

execute unless data storage ckr_utils:io list_walls[0] run return run scoreboard players set vp_progress int 100
data modify storage ckr_utils:io input set from storage ckr_utils:io list_walls[0]
data remove storage ckr_utils:io list_walls[0]

# 实例化墙体
function ckr_utils:wall_area/_new
tag @e[tag=result,limit=1] add vp_instance
execute as @e[tag=result,limit=1] run function ckr_utils:wall_area/_get
execute store result score vec_x int run data get storage vp_core:io field_center[0] 10000
execute store result score vec_y int run data get storage vp_core:io field_center[1] 10000
execute store result score vec_z int run data get storage vp_core:io field_center[2] 10000
function ckr_utils:wall_area/_shift_vec
execute as @e[tag=result,limit=1] run function ckr_utils:wall_area/_store
execute as @e[tag=math_marker,limit=1] run function ckr_utils:wall_area/_update_display

# 计算构造进度
execute store result score vp_progress int run data get storage ckr_utils:io list_walls
scoreboard players operation vp_progress int -= walls_cnt int
scoreboard players operation vp_progress int *= -1 int
scoreboard players operation @e[tag=result,limit=1] int = vp_progress int
scoreboard players operation vp_progress int *= 100 int
scoreboard players operation vp_progress int /= walls_cnt int
scoreboard players operation vp_progress int > 1 int