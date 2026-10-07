#vve_tutor:nice_bike/_class
# 生成预设静态数据模板

function vve_tutor:nice_bike/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
# 车身尺寸
scoreboard players set scale_u int 10000
scoreboard players set scale_v int 7500
scoreboard players set scale_w int 20000
function vve:cubox/_calc_shift
# 转弯半径
scoreboard players set rotation_r int 15000
# 质量和惯量
scoreboard players set mass int 50
scoreboard players set inp int 120
function vve:cubox/_calc_tensor_i
# 前进/后退功率
scoreboard players set forward_power int 20000
scoreboard players set backward_power int -16000
# 发动机参数
scoreboard players set target_power int 0
scoreboard players set damp_x int 0
scoreboard players set damp_k int 17
scoreboard players set damp_b int 20
scoreboard players set damp_f int 1000
scoreboard players set v_max int 2500
# 姿态控制器参数
scoreboard players set vve_euler_k int 85
scoreboard players set vve_euler_b int 100
scoreboard players set vve_euler_f int 100
scoreboard players set vve_euler_max int 300000
scoreboard players set vve_euler_vmax int 2000
scoreboard players set target_theta int -2147483648
scoreboard players set target_phi int -2147483648
scoreboard players set target_psi int -2147483648
function vve_tutor:nice_bike/_model
data modify storage vve_tutor:class nice_bike_plate set from storage vve_tutor:io result