#ckr_utils:constructors/spawn_vehicles/_get
# 实体对象赋值到临时对象
# 输入执行实体

scoreboard players operation vp_progress int = @s vp_progress
data modify storage ckr_utils:io list_uuids set from entity @s data.list_uuids
scoreboard players operation vehicles_cnt int = @s vehicles_cnt
data modify storage vp_core:io field_center set from entity @s data.field_center
scoreboard players operation d int = @s d
scoreboard players operation l int = @s l
scoreboard players operation x int = @s x
scoreboard players operation y int = @s y
scoreboard players operation z int = @s z
scoreboard players operation ivec_x int = @s ivec_x
scoreboard players operation ivec_y int = @s ivec_y
scoreboard players operation ivec_z int = @s ivec_z
scoreboard players operation jvec_x int = @s jvec_x
scoreboard players operation jvec_y int = @s jvec_y
scoreboard players operation jvec_z int = @s jvec_z
scoreboard players operation kvec_x int = @s kvec_x
scoreboard players operation kvec_y int = @s kvec_y
scoreboard players operation kvec_z int = @s kvec_z
scoreboard players operation quat_x int = @s quat_x
scoreboard players operation quat_y int = @s quat_y
scoreboard players operation quat_z int = @s quat_z
scoreboard players operation quat_w int = @s quat_w
scoreboard players operation quat_start_x int = @s quat_start_x
scoreboard players operation quat_start_y int = @s quat_start_y
scoreboard players operation quat_start_z int = @s quat_start_z
scoreboard players operation quat_start_w int = @s quat_start_w
scoreboard players operation quat_orth_x int = @s quat_orth_x
scoreboard players operation quat_orth_y int = @s quat_orth_y
scoreboard players operation quat_orth_z int = @s quat_orth_z
scoreboard players operation quat_orth_w int = @s quat_orth_w
scoreboard players operation quat_phi int = @s quat_phi