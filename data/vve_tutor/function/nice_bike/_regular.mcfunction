#vve_tutor:nice_bike/_regular
# 规整化姿态，消除法向角速度
# 输入nvec{...}
# 输入receiver{...}
# 输出<temp_surface,int>
# 需要传入世界实体为执行者

scoreboard players set temp_surface int 0
execute if score shift_cnt int matches ..2 run return run function vve_tutor:nice_bike/regular_2
# 补充列表
execute store result score temp_surface int if data storage vve:io shift_points[2]
data modify storage vve:io shift_points append from storage vve:io not_shift_points[]
data modify storage vve:io shift_origins append from storage vve:io not_shift_origins[]

# 叉乘计算表面法向量
execute store result score stemp_x int run data get storage vve:io shift_points[1][0] 10000
execute store result score stemp_y int run data get storage vve:io shift_points[1][1] 10000
execute store result score stemp_z int run data get storage vve:io shift_points[1][2] 10000
execute store result score vec_x int run data get storage vve:io shift_points[0][0] 10000
execute store result score vec_y int run data get storage vve:io shift_points[0][1] 10000
execute store result score vec_z int run data get storage vve:io shift_points[0][2] 10000
execute store result score fvec_x int run data get storage vve:io shift_points[2][0] 10000
execute store result score fvec_y int run data get storage vve:io shift_points[2][1] 10000
execute store result score fvec_z int run data get storage vve:io shift_points[2][2] 10000
scoreboard players operation vec_x int -= stemp_x int
scoreboard players operation vec_y int -= stemp_y int
scoreboard players operation vec_z int -= stemp_z int
scoreboard players operation fvec_x int -= stemp_x int
scoreboard players operation fvec_y int -= stemp_y int
scoreboard players operation fvec_z int -= stemp_z int
function math:vec/_cross_fvec_high
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get vec_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get vec_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get vec_z int
data modify entity @s Pos set from storage math:io xyz
execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score vec_x int run data get storage math:io xyz[0] 10000
execute store result score vec_y int run data get storage math:io xyz[1] 10000
execute store result score vec_z int run data get storage math:io xyz[2] 10000
scoreboard players operation nvec_x int *= vec_x int
scoreboard players operation nvec_y int *= vec_y int
scoreboard players operation nvec_z int *= vec_z int
scoreboard players operation nvec_x int += nvec_y int
scoreboard players operation nvec_x int += nvec_z int
scoreboard players set stemp_s int 1
execute if score nvec_x int matches ..-1 run scoreboard players set stemp_s int -1
scoreboard players operation nvec_x int = vec_x int
scoreboard players operation nvec_y int = vec_y int
scoreboard players operation nvec_z int = vec_z int
scoreboard players operation nvec_x int *= stemp_s int
scoreboard players operation nvec_y int *= stemp_s int
scoreboard players operation nvec_z int *= stemp_s int

function math:uvw/_nvec_to
scoreboard players set cos int -2147483648
# 设置各面法向量
scoreboard players set sstemp_n1_x int -2190
scoreboard players set sstemp_n1_y int 9735
scoreboard players set sstemp_n1_z int 0

scoreboard players set sstemp_n2_x int 2190
scoreboard players set sstemp_n2_y int 9735
scoreboard players set sstemp_n2_z int 0

# 与各面法向量点乘
scoreboard players operation sstemp_d1 int = u int
scoreboard players operation sstemp_d1 int *= sstemp_n1_x int
scoreboard players operation sstemp_m int = v int
scoreboard players operation sstemp_m int *= sstemp_n1_y int
scoreboard players operation sstemp_d1 int += sstemp_m int
scoreboard players operation sstemp_m int = w int
scoreboard players operation sstemp_m int *= sstemp_n1_z int
scoreboard players operation sstemp_d1 int += sstemp_m int
scoreboard players operation sstemp_d1 int /= 10000 int
scoreboard players operation cos int > sstemp_d1 int

scoreboard players operation sstemp_d2 int = u int
scoreboard players operation sstemp_d2 int *= sstemp_n2_x int
scoreboard players operation sstemp_m int = v int
scoreboard players operation sstemp_m int *= sstemp_n2_y int
scoreboard players operation sstemp_d2 int += sstemp_m int
scoreboard players operation sstemp_m int = w int
scoreboard players operation sstemp_m int *= sstemp_n2_z int
scoreboard players operation sstemp_d2 int += sstemp_m int
scoreboard players operation sstemp_d2 int /= 10000 int
scoreboard players operation cos int > sstemp_d2 int

# 选择贴合面
execute if score cos int = sstemp_d1 int run return run function vve_tutor:nice_bike/regular/surface_1
execute if score cos int = sstemp_d2 int run return run function vve_tutor:nice_bike/regular/surface_2