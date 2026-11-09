#ckr_utils:wall_area/_shulker_to
# 从潜影贝读入临时对象
# 输入entity @e[type=minecraft:shulker]

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

# 计算y坐标和高度
execute if score stemp_y2 int < stemp_y1 int run scoreboard players operation stemp_y1 int >< stemp_y2 int
execute store result score h int run scoreboard players operation stemp_y2 int -= stemp_y1 int
execute store result score y int run scoreboard players operation h int /= 2 int
scoreboard players operation y int += stemp_y1 int

# 计算xz方向符号和绝对值
execute store result score stemp_abs_x int run scoreboard players operation stemp_x2 int -= stemp_x1 int
execute store result score stemp_abs_z int run scoreboard players operation stemp_z2 int -= stemp_z1 int
execute if score stemp_abs_x int matches ..-1 run scoreboard players operation stemp_abs_x int *= -1 int
execute if score stemp_abs_z int matches ..-1 run scoreboard players operation stemp_abs_z int *= -1 int
scoreboard players operation stemp_sign_x int = stemp_x2 int
scoreboard players operation stemp_sign_z int = stemp_z2 int
scoreboard players operation stemp_sign_x int /= stemp_abs_x int
scoreboard players operation stemp_sign_z int /= stemp_abs_z int

# 计算宽度
scoreboard players operation d int = stemp_abs_x int
scoreboard players operation d int > stemp_abs_z int
scoreboard players operation d int /= 2 int

# 计算长度
scoreboard players set l int 15000

# 计算法向量
scoreboard players set nvec_y int 0
scoreboard players operation nvec_x int = stemp_sign_x int
scoreboard players operation nvec_z int = stemp_sign_z int
execute if score stemp_abs_x int > stemp_abs_z int run scoreboard players set nvec_x int 0
execute if score stemp_abs_x int <= stemp_abs_z int run scoreboard players set nvec_z int 0
scoreboard players operation nvec_x int *= 10000 int
scoreboard players operation nvec_z int *= 10000 int

# 计算xz坐标
scoreboard players operation stemp_x2 int += stemp_x1 int
scoreboard players operation stemp_z2 int += stemp_z1 int
execute if score stemp_x2 int < stemp_x1 int run scoreboard players operation stemp_x1 int >< stemp_x2 int
execute if score stemp_z2 int < stemp_z1 int run scoreboard players operation stemp_z1 int >< stemp_z2 int
scoreboard players operation x int = stemp_x2 int
scoreboard players operation x int -= stemp_x1 int
scoreboard players operation x int /= 2 int
scoreboard players operation x int += stemp_x1 int
scoreboard players operation z int = stemp_z2 int
scoreboard players operation z int -= stemp_z1 int
scoreboard players operation z int /= 2 int
scoreboard players operation z int += stemp_z1 int