#ckr_utils:pool_area/_shulker_to
# 从潜影贝读入临时对象
# 输入entity @e[type=minecraft:shulker,tag=]
# 占用<h,int,1w>

# 读入第一个坐标
tag @e[type=minecraft:shulker,limit=1,tag=] add tmp
data modify storage math:io xyz set from entity @e[tag=tmp,limit=1] Pos
kill @e[tag=tmp,limit=1]
execute store result score stemp_x1 int run data get storage math:io xyz[0] 10000
execute store result score stemp_y1 int run data get storage math:io xyz[1] 10000
execute store result score stemp_z1 int run data get storage math:io xyz[2] 10000

# 读入第二个坐标
tag @e[type=minecraft:shulker,limit=1,tag=] add tmp
data modify storage math:io xyz set from entity @e[tag=tmp,limit=1] Pos
kill @e[tag=tmp,limit=1]
execute store result score stemp_x2 int run data get storage math:io xyz[0] 10000
execute store result score stemp_y2 int run data get storage math:io xyz[1] 10000
execute store result score stemp_z2 int run data get storage math:io xyz[2] 10000

# 计算较小值和较大者
execute if score stemp_x2 int < stemp_x1 int run scoreboard players operation stemp_x1 int >< stemp_x2 int
execute if score stemp_y2 int < stemp_y1 int run scoreboard players operation stemp_y1 int >< stemp_y2 int
execute if score stemp_z2 int < stemp_z1 int run scoreboard players operation stemp_z1 int >< stemp_z2 int

# 计算长宽高的一半，中心坐标
execute store result score d int run scoreboard players operation stemp_x2 int -= stemp_x1 int
execute store result score h int run scoreboard players operation stemp_y2 int -= stemp_y1 int
execute store result score l int run scoreboard players operation stemp_z2 int -= stemp_z1 int
execute store result score x int run scoreboard players operation d int /= 2 int
execute store result score y int run scoreboard players operation h int /= 2 int
execute store result score z int run scoreboard players operation l int /= 2 int
scoreboard players operation x int += stemp_x1 int
scoreboard players operation y int += stemp_y1 int
scoreboard players operation z int += stemp_z1 int

# 设置其它参数
scoreboard players set spawn_interval int 3
scoreboard players set spawn_timer int 0
scoreboard players set spawn_max int 6
data modify storage ckr_utils:io spawn_plates set value []