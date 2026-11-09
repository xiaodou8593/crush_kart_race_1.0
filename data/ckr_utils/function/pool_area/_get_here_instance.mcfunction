#ckr_utils:pool_area/_get_here_instance
# 获取执行位置所在的刷怪区实例
# 输入执行位置
# 输出entity @e[tag=result]
# 传入世界实体为执行者

# 获取检查位置
tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score c_x int run data get storage math:io xyz[0] 10000
execute store result score c_y int run data get storage math:io xyz[1] 10000
execute store result score c_z int run data get storage math:io xyz[2] 10000

tag @e[tag=result] remove result
execute as @e[tag=ckr_utils_pool_area] run function ckr_utils:pool_area/get_here_check

# 区块安全
tp @s 0 0 0