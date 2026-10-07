#vve_tutor:_detect_plane
# 自定义介质探测
# 输入执行位置
# 输入cpoint{...}
# 输入<plane_y,int,1w>
# 输出介质响应(各模块的临时对象)
# 传入世界实体为执行者(不保证Pos位于执行位置)

# 各模块响应信号重置
scoreboard players set shift_response int 0
scoreboard players set impulse_response int 0
scoreboard players set friction_response int 10000
scoreboard players set grab_layer_response int 0
scoreboard players set bounce_layer_response int 0
scoreboard players set material_response int 0
scoreboard players set surface_response int 0

# 斜面介质
# 获取区块坐标
scoreboard players operation chunk_x int = c_x int
scoreboard players operation chunk_z int = c_z int
scoreboard players operation chunk_x int /= 10000 int
scoreboard players operation chunk_z int /= 10000 int
scoreboard players operation chunk_x int /= 16 int
scoreboard players operation chunk_z int /= 16 int
# 区块查询
execute as @e[x=0,y=8,z=0,distance=..1,predicate=vve:match_chunk] run function vve:call_material
execute if score material_response int matches 1.. run return fail

# 墙介质
execute if block ~ ~ ~ minecraft:barrier run return run function vve_tutor:barrier_wall

# 空气介质
execute if score c_y int > plane_y int run return run scoreboard players operation friction_response int = vve_air_friction int

# 地面介质
scoreboard players set grab_layer_response int 1
scoreboard players operation grab_depth int = plane_y int
scoreboard players operation grab_depth int -= c_y int
scoreboard players set nvec_x int 0
scoreboard players set nvec_y int 10000
scoreboard players set nvec_z int 0

# 计算沿法线反方向的速度
scoreboard players operation stemp_v int = c_vx int
scoreboard players operation stemp_v int *= nvec_x int
scoreboard players operation stemp_0 int = c_vy int
scoreboard players operation stemp_0 int *= nvec_y int
scoreboard players operation stemp_v int += stemp_0 int
scoreboard players operation stemp_0 int = c_vz int
scoreboard players operation stemp_0 int *= nvec_z int
scoreboard players operation stemp_v int += stemp_0 int
scoreboard players operation stemp_v int /= -10000 int
# 附着层响应
execute if score grab_depth int <= grab_depth_max int run return run function vve:grab_layer/response
# 实心层反弹
scoreboard players set bounce_layer_response int 1
# 取消附着层响应
scoreboard players set grab_layer_response int 0

# 摩擦响应
scoreboard players operation friction_response int = vve_solid_friction int

# 位移至特定深度
scoreboard players set shift_response int 1
scoreboard players operation stemp_depth int = grab_depth int
scoreboard players operation stemp_depth int -= grab_depth_mid int
scoreboard players operation shift_x int = nvec_x int
scoreboard players operation shift_y int = nvec_y int
scoreboard players operation shift_z int = nvec_z int
scoreboard players operation shift_x int *= stemp_depth int
scoreboard players operation shift_y int *= stemp_depth int
scoreboard players operation shift_z int *= stemp_depth int
scoreboard players operation shift_x int /= 10000 int
scoreboard players operation shift_y int /= 10000 int
scoreboard players operation shift_z int /= 10000 int

# 脱离速度忽略
execute if score stemp_v int matches ..-1 run return fail

# 施加反弹冲量
scoreboard players set impulse_response int 1
scoreboard players operation impulse_x int = c_x int
scoreboard players operation impulse_y int = c_y int
scoreboard players operation impulse_z int = c_z int
scoreboard players operation stemp_x int = nvec_x int
scoreboard players operation stemp_y int = nvec_y int
scoreboard players operation stemp_z int = nvec_z int
scoreboard players operation stemp_x int *= stemp_v int
scoreboard players operation stemp_y int *= stemp_v int
scoreboard players operation stemp_z int *= stemp_v int
scoreboard players operation stemp_x int /= vve_solid_bounce_inv int
scoreboard players operation stemp_y int /= vve_solid_bounce_inv int
scoreboard players operation stemp_z int /= vve_solid_bounce_inv int
scoreboard players operation stemp_x int *= c_mass int
scoreboard players operation stemp_y int *= c_mass int
scoreboard players operation stemp_z int *= c_mass int

# 施加切向摩擦力
scoreboard players operation impulse_fx int = c_vx int
scoreboard players operation impulse_fy int = c_vy int
scoreboard players operation impulse_fz int = c_vz int
scoreboard players operation impulse_fx int *= nvec_x int
scoreboard players operation impulse_fy int *= nvec_y int
scoreboard players operation impulse_fz int *= nvec_z int
scoreboard players operation impulse_fz int += impulse_fx int
scoreboard players operation impulse_fz int += impulse_fy int
execute store result score impulse_fx int store result score impulse_fy int run scoreboard players operation impulse_fz int /= 10000 int
scoreboard players operation impulse_fx int *= nvec_x int
scoreboard players operation impulse_fy int *= nvec_y int
scoreboard players operation impulse_fz int *= nvec_z int
scoreboard players operation impulse_fx int /= -10000 int
scoreboard players operation impulse_fy int /= -10000 int
scoreboard players operation impulse_fz int /= -10000 int
scoreboard players operation impulse_fx int += c_vx int
scoreboard players operation impulse_fy int += c_vy int
scoreboard players operation impulse_fz int += c_vz int
scoreboard players operation stemp_k int = vve_solid_friction_tan int
scoreboard players remove stemp_k int 10000
scoreboard players operation impulse_fx int *= stemp_k int
scoreboard players operation impulse_fy int *= stemp_k int
scoreboard players operation impulse_fz int *= stemp_k int
scoreboard players operation impulse_fx int /= 10000 int
scoreboard players operation impulse_fy int /= 10000 int
scoreboard players operation impulse_fz int /= 10000 int
scoreboard players operation impulse_fx int *= c_mass int
scoreboard players operation impulse_fy int *= c_mass int
scoreboard players operation impulse_fz int *= c_mass int

scoreboard players operation impulse_fx int += stemp_x int
scoreboard players operation impulse_fy int += stemp_y int
scoreboard players operation impulse_fz int += stemp_z int