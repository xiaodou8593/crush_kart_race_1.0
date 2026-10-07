#ckr_utils:guis/track_edit/place_slope
# ckr_utils:guis/track_edit/main调用

data modify storage math:io xyz set from entity @e[tag=ckr_slope_point,limit=1] Pos
kill @e[tag=ckr_slope_point,limit=1]
execute store result score temp_x_1 int run data get storage math:io xyz[0] 10000
execute store result score temp_y_1 int run data get storage math:io xyz[1] 10000
execute store result score temp_z_1 int run data get storage math:io xyz[2] 10000

data modify storage math:io xyz set from entity @e[tag=ckr_slope_point,limit=1] Pos
kill @e[tag=ckr_slope_point,limit=1]
execute store result score temp_x_2 int run data get storage math:io xyz[0] 10000
execute store result score temp_y_2 int run data get storage math:io xyz[1] 10000
execute store result score temp_z_2 int run data get storage math:io xyz[2] 10000

data modify storage math:io xyz set from entity @e[tag=ckr_slope_point,limit=1] Pos
kill @e[tag=ckr_slope_point,limit=1]
execute store result score temp_x_3 int run data get storage math:io xyz[0] 10000
execute store result score temp_y_3 int run data get storage math:io xyz[1] 10000
execute store result score temp_z_3 int run data get storage math:io xyz[2] 10000

data modify storage math:io xyz set from entity @e[tag=ckr_slope_point,limit=1] Pos
kill @e[tag=ckr_slope_point,limit=1]
execute store result score temp_x_4 int run data get storage math:io xyz[0] 10000
execute store result score temp_y_4 int run data get storage math:io xyz[1] 10000
execute store result score temp_z_4 int run data get storage math:io xyz[2] 10000

# 计算起点, 宽度, 宽度方向
execute if score temp_x_2 int < temp_x_1 int run scoreboard players operation temp_x_2 int >< temp_x_1 int
execute if score temp_z_2 int < temp_z_1 int run scoreboard players operation temp_z_2 int >< temp_z_1 int
scoreboard players operation temp_x_2 int -= temp_x_1 int
scoreboard players operation temp_z_2 int -= temp_z_1 int
data modify storage ckr_utils:io temp_0 set value "z"
execute if score temp_z_2 int > temp_x_2 int run data modify storage ckr_utils:io temp_0 set value "x"
scoreboard players operation w int = temp_x_2 int
scoreboard players operation w int > temp_z_2 int
scoreboard players operation x int = temp_x_1 int
scoreboard players operation y int = temp_y_1 int
scoreboard players operation z int = temp_z_1 int

# 计算长度, 长度方向
scoreboard players operation temp_x_3 int -= x int
scoreboard players operation temp_z_3 int -= z int
execute if score temp_z_2 int <= temp_x_2 int run scoreboard players operation l int = temp_z_3 int
execute if score temp_z_2 int > temp_x_2 int run scoreboard players operation l int = temp_x_3 int
data modify storage ckr_utils:io temp_1 set value "p"
execute if score l int matches ..-1 run data modify storage ckr_utils:io temp_1 set value "n"
execute if score l int matches ..-1 run scoreboard players operation l int *= -1 int

# 计算高度
scoreboard players operation h int = temp_y_4 int
scoreboard players operation h int -= y int

# 设置基底厚度
scoreboard players set base_layer int 10000

# 计算区块参数, 法向量参数, 生成实例
execute as @e[tag=math_marker,limit=1] run function ckr_utils:guis/track_edit/place_slope_call with storage ckr_utils:io {}

kill @e[tag=ckr_slope_point]