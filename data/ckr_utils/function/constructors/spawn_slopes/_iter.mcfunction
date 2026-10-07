#ckr_utils:constructors/spawn_slopes/_iter
# 临时对象运行一次构造迭代
# 输出entity @e[tag=vp_instance]

data modify storage vve:io input set from storage ckr_utils:io list_slopes[0]
data remove storage ckr_utils:io list_slopes[0]

# 实例化斜面
function ckr_utils:constructors/spawn_slopes/spawn with storage vve:io input

# 计算构造进度
execute store result score vp_progress int run data get storage ckr_utils:io list_slopes
scoreboard players operation vp_progress int -= slopes_cnt int
scoreboard players operation vp_progress int *= -1 int
scoreboard players operation @e[tag=result,limit=1] int = vp_progress int
scoreboard players operation vp_progress int *= 100 int
scoreboard players operation vp_progress int /= slopes_cnt int
scoreboard players operation vp_progress int > 1 int