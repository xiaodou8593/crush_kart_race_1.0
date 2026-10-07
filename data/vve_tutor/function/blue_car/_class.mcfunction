#vve_tutor:blue_car/_class
# 生成预设静态数据模板

function vve_tutor:blue_car/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
# 车身尺寸
scoreboard players set scale_u int 11500
scoreboard players set scale_v int 7000
scoreboard players set scale_w int 18000
function vve:cubox/_calc_shift
# 转弯半径
scoreboard players set rotation_r int 75000
# 质量和惯量
scoreboard players set mass int 50
scoreboard players set inp int 120
function vve:cubox/_calc_tensor_i
# 前进/后退功率
scoreboard players set forward_power int 160000
scoreboard players set backward_power int -80000
# 发动机参数
scoreboard players set target_power int 0
scoreboard players set damp_x int 0
scoreboard players set damp_k int 17
scoreboard players set damp_b int 20
scoreboard players set damp_f int 1000
scoreboard players set v_max int 6000
function vve_tutor:blue_car/_model
data modify storage vve_tutor:class blue_car_plate set from storage vve_tutor:io result